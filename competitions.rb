require 'sqlite3'
require 'twitter'

# retweet to win

config = {
    :consumer_key => 'eMC5c3zj2zRBYYMWbjOUT3jzu',
    :consumer_secret => 'wlmDAh684VyamyNsiv9M2swZc2TuDog6Gp1rFzbYgoFOwZlFce',
    :access_token => '840622463969067009-DTn2b3dUSKQOS5LSG5AB8VJuJ7UyaAa',
    :access_token_secret => 'BL9JMzQ0eYQHQfNGsVBM58c5TUE9Awvox0u3j8n0e0m04'
    }
@client = Twitter::REST::Client.new(config) 
@database = SQLite3::Database.new "database.sqlite3"

#@client.update("Retweet for a chance to win!")

# tweet a week before
# then somehow get the id of the tweet

begin
    myArray = @client.retweeters_of(858941019748003840)
    item = myArray[rand(myArray.length)]
    puts "putting"
    puts item

    # keeps picking a random until it finds a user in the database
    until !@database.execute('SELECT twittername FROM users WHERE twittername=?', [item.screen_name])[0].nil?)
        myArray = @client.retweeters_of(858941019748003840)
        item = myArray[rand(myArray.length)]
    end
    @database.execute('UPDATE users SET win=1 WHERE twittername=?', [item.screen_name])

rescue Twitter::Error::TooManyRequests => err
    # error
end
