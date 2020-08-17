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

get '/order_handler' do
    client = Twitter::REST::Client.new(config)    
    
    if session[:order_handler] != true 
        #redirect "/not_found"
    end
    
    tweets = client.mentions_timeline()

    tweets.each do |tweetFromTwitter|
        id = tweetFromTwitter.id.to_i
        user = tweetFromTwitter.user.screen_name
        text = tweetFromTwitter.text
        date = tweetFromTwitter.created_at.to_s
        time = date[11..15]

        madeIntoOrder = false
        found = false
        free_pizza = false
        
        @table = @database.execute('SELECT * FROM tweets')
        @table.each do |tweetInDatabase|
            if id == tweetInDatabase[0] then
                found = true
            end
        end
        
        @orders = @database.execute('SELECT * FROM orders')
        @orders.each do |order|
            if id == order[0] then
                madeIntoOrder = true
            end
        end
            
        if found == false && madeIntoOrder == false then
            @database.execute(
                'INSERT INTO tweets (tweetId, username, text, time) VALUES (?, ?, ?, ?)', 
                [id, user, text, time]
            )
        end
    end
        
        tweets = @database.execute('SELECT * FROM tweets')
        cancels = Array.new
        tweets.each do |tweet|
            if (tweet[2].upcase.include? "CANCEL") then       
                seen = @database.execute("SELECT seen FROM tweets WHERE tweetId = #{tweet[0]}")
                if seen[0][0] == 0
                    cancels.push(tweet)
                end
            end
        end
        
        cancels.each do |cancel|
            cancelmsg = cancel[2].strip.to_s
            bracket1 = cancelmsg.index('(')
            bracket2 = cancelmsg.index(')')
            user_name = cancel[1]
            user_name1 = ("@" + user_name)
            if !bracket1.nil? && !bracket2.nil?
                orderNO = cancelmsg[(bracket1+1)..(bracket2-1)]
                username = @database.execute("SELECT username FROM orders WHERE orderID = #{orderNO}")
                testname = cancel[1].to_s
                if username[0][0] == testname
                    completedtest = @database.execute( "SELECT completed FROM orders WHERE orderID = #{orderNO}")
                    if completedtest[0][0] == 0
                        @database.execute( "UPDATE orders SET cancelled = 1 WHERE orderID = #{orderNO};")
                        @database.execute( "UPDATE tweets SET seen = 1 WHERE tweetId = #{cancel[0]};")
                        client.update("#{user_name1} Your order has been cancelled by your request. Have a nice day")
                    else
                        @database.execute( "UPDATE tweets SET seen = 1 WHERE tweetId = #{cancel[0]};")
                        client.update("#{user_name1} Your order has already been completed, you can't cancel this order. Sorry.")
                        
                    end
                end
            else
                
                if cancel[4] == 0
                    client.update("#{user_name1} To cancel an order, include the word cancel in your message, and make sure the order number is between brackets")
                    @database.execute( "UPDATE tweets SET seen = 1 WHERE tweetId = #{cancel[0]};")
                end
            end
        end
    
        namearray = Array.new  
        validnames = Array.new
        @users_twitters = @database.execute('SELECT twittername FROM users WHERE twittername IS NOT NULL')
        length = @users_twitters.length
        (0..length).each do |x|
            adding = @users_twitters[x].to_s.strip
            length3 = adding.length - 3
            namearray.push(adding[2..length3])
        end
        
        @orders = @database.execute('SELECT * FROM orders')
        @orders.each do |order|
            thisname = order[2].to_s.strip
            thisname = order[2]
            if (namearray.include? thisname) == false
                if order[5] == 0 && order[6] == 0
                    tweetername = ("@"+thisname)
                    client.update("#{tweetername} You have not registered an account with this handle, and so can't order.")
                    dbname = ("\""+thisname+"\"")
                    @database.execute("UPDATE orders SET cancelled = 1 WHERE username = #{dbname}")
                end
            end
        end
    @table = @database.execute('SELECT * FROM orders')
    @users = @database.execute("SELECT * FROM users")
    erb :order_handler
end

post '/order_handler' do
    @table = @database.execute('SELECT * FROM orders')
    
    id = params[:order_id]
    twitternamedel = params[:usernameid]
    twitternamedelused = ("\""+twitternamedel+"\"")
    
    if params[:button] == "completed"
        @database.execute("UPDATE orders SET completed = 1 WHERE id = #{id}")
        @database.execute("UPDATE users SET promotion = 0 WHERE twittername = #{twitternamedelused}")
    elsif params[:button] == "cancelled"
        @database.execute("UPDATE orders SET cancelled = 1 WHERE id = #{id}")
    end     
    
    redirect "/order_handler"
end