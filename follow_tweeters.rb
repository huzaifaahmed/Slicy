require 'twitter'
config = {
        :consumer_key => 'eMC5c3zj2zRBYYMWbjOUT3jzu',
        :consumer_secret => 'wlmDAh684VyamyNsiv9M2swZc2TuDog6Gp1rFzbYgoFOwZlFce',
        :access_token => '840622463969067009-DTn2b3dUSKQOS5LSG5AB8VJuJ7UyaAa',
        :access_token_secret => 'BL9JMzQ0eYQHQfNGsVBM58c5TUE9Awvox0u3j8n0e0m04'
    }
client = Twitter::REST::Client.new(config)
tweets = client.mentions_timeline()
names = Array.new 
tweets.each do |tweet|
        user = tweet.user.screen_name
        if names.include?(user)
        else
            names.push(user)
            if client.friendship?(client.user(user), client.user('tweets4pizzas'))
            else
                client.follow(user)
            end
        end           
end