require 'sinatra'
require 'twitter'
require 'sqlite3'

include ERB::Util
set :bind, '0.0.0.0'

config = {
        :consumer_key => 'eMC5c3zj2zRBYYMWbjOUT3jzu',
        :consumer_secret => 'wlmDAh684VyamyNsiv9M2swZc2TuDog6Gp1rFzbYgoFOwZlFce',
        :access_token => '840622463969067009-DTn2b3dUSKQOS5LSG5AB8VJuJ7UyaAa',
        :access_token_secret => 'BL9JMzQ0eYQHQfNGsVBM58c5TUE9Awvox0u3j8n0e0m04'
    }

before do
    @database = SQLite3::Database.new "database.sqlite3"
end

get '/twitter_feed' do
     if session[:order_handler] != true 
        #redirect "/not_found"
    end
    
    client = Twitter::REST::Client.new(config)
    systemTime = Time.new.to_s
    
    tweets = client.mentions_timeline()
        
    @database.execute('DELETE FROM tweets')

    tweets.each do |tweetFromTwitter|
        id = tweetFromTwitter.id.to_i
        user = tweetFromTwitter.user.screen_name
        text = tweetFromTwitter.text
        date = tweetFromTwitter.created_at.to_s
        time = date[11..15]

        madeIntoOrder = false
        today = false
                
        if systemTime[5..6] == date[5..6] && systemTime[8..9] == date[8..9] && systemTime[0..3] == date[0..3] then
            today = true
        end
            
        @orders = @database.execute('SELECT * FROM orders')
        @orders.each do |order|
            if id == order[0] then
                madeIntoOrder = true
            end
        end
         
        if madeIntoOrder == false && today == true then
            @database.execute(
                'INSERT INTO tweets (tweetId, username, text, time) VALUES (?, ?, ?, ?)', 
                [id, user, text, time]
            )
        end
        
    end
    
    @table = @database.execute('SELECT * FROM tweets')
            
    erb :tweets
end
        
post '/twitter_feed' do
    id = params[:tweet_id]
    username = params[:user]
    text = params[:tweet_text]
    if params[:order_summary] == "" then
        summary = text  
    elsif params[:order_summary] != "" then
        summary = params[:order_summary]
    end
    price = params[:order_price].strip
    completed = 0
    cancelled = 0
    orderID = (@database.get_first_value('SELECT MAX(orderID) FROM orders')) +1 
       
    @database.execute(
        'INSERT INTO orders (tweetId, username, orderSummary, price, completed, cancelled, orderID) VALUES (?, ?, ?, ?, ?, ?, ?)', 
        [id, username, summary, price, completed, cancelled, orderID]
        )
    @database.execute("UPDATE tweets SET seen = 1 WHERE tweetID = #{id}")
    
    
    # Sending a confirmation tweet
    @user_ID = ( "@" + username)
    client = Twitter::REST::Client.new(config)    
    client.update("#{@user_ID} Your order (number #{orderID}) is confirmed. Cancel by pasting this in a tweet @ us 'Cancel order number (#{orderID})")
    
    redirect '/twitter_feed'
end