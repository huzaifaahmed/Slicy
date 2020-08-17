require 'twitter'

post '/moduser' do
    @database = SQLite3::Database.new "database.sqlite3"
    status = params[:user_status]
    deleted = params[:delete_user]

    privilege = 0
    # Change user status
    if status == "User"
        privilege = 0
    elsif status == "Order Handler"       
        privilege = 2
    elsif status == "Administrator"
        privilege = 1
    end

    users = session[:admin_selected_user]
    @database.execute('UPDATE users SET admin=? WHERE username=?',
        [privilege, users[3]])

    # Delete user
    if deleted == "deleted"
        @database.execute('DELETE FROM users WHERE username=?', [users[3]])
    end

    redirect "/admin"
end

post '/delmenu_pizza' do
    pizza_name = params[:admin_menu_item]
    location = session[:location]
    @database = SQLite3::Database.new "menu.sqlite3"
    if location == "sheffield"
        @database.execute('DELETE FROM menu_items WHERE name=?', [pizza_name])
    elsif location == "london"
        @database.execute('DELETE FROM menu_items_london WHERE name=?', [pizza_name])
    end

    redirect "/menu"
end

post '/newmenu_pizza' do
    location = session[:location]
    @database = SQLite3::Database.new "menu.sqlite3"
    if location == "sheffield"
        @database.execute('INSERT INTO menu_items VALUES (?,?,?,?)',
            [params[:field0], params[:field1], params[:field2], params[:field3]])
    elsif location == "london"
        @database.execute('INSERT INTO menu_items_london VALUES (?,?,?,?)',
            [params[:field0], params[:field1], params[:field2], params[:field3]])
    end

    redirect "/menu"
end

post '/delmenu_dessert' do
    location = session[:location]
    pizza_name = params[:admin_menu_item]
    @database = SQLite3::Database.new "menu.sqlite3"
    if location == "sheffield"
        @database.execute('DELETE FROM dessert_items WHERE name=?', [pizza_name])
    elsif location == "london"
        @database.execute('DELETE FROM dessert_items_london WHERE name=?', [pizza_name])
    end

    redirect "/menu_desserts"
end

post '/newmenu_dessert' do
    @database = SQLite3::Database.new "menu.sqlite3"
    location = session[:location]
    if location == "sheffield"
        @database.execute('INSERT INTO dessert_items VALUES (?,?,?)',
            [params[:field0], params[:field1], params[:field2]])
    elsif location == "london"
        @database.execute('INSERT INTO dessert_items_london VALUES (?,?,?)',
            [params[:field0], params[:field1], params[:field2]])
    end

    redirect "/menu_desserts"
end

post '/delmenu_drink' do
    pizza_name = params[:admin_menu_item]
    @database = SQLite3::Database.new "menu.sqlite3"
    location = session[:location]
    if location == "sheffield"
        @database.execute('DELETE FROM drink_items WHERE name=?', [pizza_name])
    elsif location == "london"
        @database.execute('DELETE FROM drink_items_london WHERE name=?', [pizza_name])
    end

    redirect "/menu_drinks"
end

post '/newmenu_drinks' do
    @database = SQLite3::Database.new "menu.sqlite3"
    location = session[:location]
    if location == "sheffield"
        @database.execute('INSERT INTO drink_items VALUES (?,?)',
            [params[:field0], params[:field1]])
    elsif location == "london"
        @database.execute('INSERT INTO drink_items_london VALUES (?,?)',
            [params[:field0], params[:field1]])
    end

    redirect "/menu_drinks"
end

post '/delmenu_sides' do
    pizza_name = params[:admin_menu_item]
    location = session[:location]
    @database = SQLite3::Database.new "menu.sqlite3"
    if location == "sheffield"
        @database.execute('DELETE FROM side_items WHERE name=?', [pizza_name])
    elsif location == "london"
        @database.execute('DELETE FROM side_items_london WHERE name=?', [pizza_name])
    end

    redirect "/menu_sides"
end

post '/newmenu_sides' do
    @database = SQLite3::Database.new "menu.sqlite3"
    location = session[:location]
    if location == "sheffield"
        @database.execute('INSERT INTO side_items VALUES (?,?,?,?)',
            [params[:field0], params[:field1], params[:field2], params[:field3]])
    elsif location == "london"
        @database.execute('INSERT INTO side_items_london VALUES (?,?,?,?)',
            [params[:field0], params[:field1], params[:field2], params[:field3]])
    end

    redirect "/menu_sides"
end

get '/admin' do
    @database = SQLite3::Database.new "database.sqlite3"

    if session[:admin] != true 
        redirect "/not_found"
    end

    unless params[:search].nil?
        search_string = params[:search]
        @users = @database.execute('SELECT * FROM users WHERE username=?', [search_string])
        session[:admin_selected_user] = @users[0]
    end
    erb :admin 
end

def compete code
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
        myArray = @client.retweeters_of(code)
        item = myArray[rand(myArray.length)]

        # keeps picking a random until it finds a user in the database
        until !@database.execute('SELECT twittername FROM users WHERE twittername=?', [item.screen_name])[0].nil?
            myArray = @client.retweeters_of(code)
            item = myArray[rand(myArray.length)]
        end
        @database.execute('UPDATE users SET win=1 WHERE twittername=?', [item.screen_name])

    rescue Twitter::Error::TooManyRequests => err
        # error
    end
end

get '/competitions' do
    erb :competitions
end

post '/competitions' do
    competes = params[:tweetID]
    compete competes
end

post '/promo' do
    config = {
        :consumer_key => 'eMC5c3zj2zRBYYMWbjOUT3jzu',
        :consumer_secret => 'wlmDAh684VyamyNsiv9M2swZc2TuDog6Gp1rFzbYgoFOwZlFce',
        :access_token => '840622463969067009-DTn2b3dUSKQOS5LSG5AB8VJuJ7UyaAa',
        :access_token_secret => 'BL9JMzQ0eYQHQfNGsVBM58c5TUE9Awvox0u3j8n0e0m04'
        }
    client = Twitter::REST::Client.new(config)
    username = params[:user].to_s
    @database = SQLite3::Database.new "database.sqlite3"
    usernamedb = ("\""+username+"\"")
    @database.execute( "UPDATE users SET promotion = 1 WHERE username = #{usernamedb};")
    begin
        # send a dm to username
        client.create_direct_message(username, "You received 15% off your order")
    rescue Twitter::Error => err
        #error
    end

    redirect '/admin'
end
