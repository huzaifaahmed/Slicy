
enable :sessions
 set :session_secret, 'super secret'

get '/sign_up' do
    @submitted = false
    erb :sign_up
end

post '/sign_up' do
    @submitted = true
    
    # values
    @username = params[:username].strip
    @password = params[:password].strip
    @firstname = params[:firstname].strip
    @lastname = params[:lastname].strip
    @email = params[:email].strip
    @address = params[:address].strip
    @postcode = params[:postcode].strip
    @phone = params[:phone].strip
    @twittername = params[:twittername].strip
    
    # validation
    @username_ok = !@username.nil? && @username != ""
    @password_ok = !@password.nil? && @password != ""
    @firstname_ok = !@firstname.nil? && @firstname != ""
    @lastname_ok = !@lastname.nil? && @lastname != ""
    @email_ok = !@email.nil? && @email != ""
    @address_ok = !@address.nil? && @address != ""
    @postcode_ok = /([Ss]([1-9])|([1][0-4]))([0-9][a-zA-Z]{2})/.match("#{@postcode}")
    @phone_ok = /07[0-9]{8}/.match("#{@phone}")
    @twittername_ok = !@twittername.nil? && @twittername != ""
    
    @all_ok = @username_ok && @password_ok && @firstname_ok && @lastname_ok && @email_ok && @address_ok && @postcode_ok && @phone_ok && @twittername_ok
    
    # sending a confirmation email
    #if @all_ok
    #    smtp = { :address => 'mail.gmail.com', :port => 4567, :domain => 'gmail.com', :user_name => 'pizzashedsheffield@gmail.com', :password => 'pizzashedpass', :enable_starttls_auto => true, :openssl_verify_mode => 'none' }
    #    Mail.defaults { delivery_method :smtp, smtp }
    #    
    #    mail = Mail.new do
    #      from    'pizzashedsheffield@gmail.com'
    #      to      '@email'
    #      subject 'VERIFICATION EMAIL'
    #      body    'Thanks for registering with Pizzashed'
    #    end


        #mail.deliver!
    #end
 
    #adding the data to the database
    if @all_ok
        #get next available ID
        @database = SQLite3::Database.new "database.sqlite3"
        id = @database.get_first_value 'SELECT MAX(id)+1 FROM users'
        
        #encrypted password
        hash = BCrypt::Password.create(@password)
        
        #do the insert
       
        @database.execute( 
            "INSERT INTO users ( id, firstname, lastname, username, twittername, password, email, address, postcode, phone, admin ) 
            VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )", 
            [id, @firstname, @lastname, @username, @twittername, hash, @email, @address, @postcode, @phone, 0]
            )
        
        redirect '/'
    end
    
    erb :sign_up
end

get '/sign_in' do
    @submitted = false
    erb :sign_in
end

post '/sign_in' do
    @submitted = true
    
    #values
    @username_login = params[:username_login]
    @password_login = params[:password_login]
    
    #validation
    @username_login_ok = !@username_login.nil? && @username_login != ""
    @password_login_ok = !@password_login.nil? && @password_login != ""
    @login_all_ok = @username_login_ok && @password_login_ok
    
    #checks if password entered is the same as the one you signed up with
    @database = SQLite3::Database.new "database.sqlite3"
    if @login_all_ok
        password_db = @database.execute('select password from users where username = ?', [@username_login])
        admin = @database.execute('SELECT admin FROM users WHERE username = ?', [@username_login])
        if (defined?(password_db[0][0])).nil?
            @wrong_username = true
            erb :sign_in
        elsif BCrypt::Password.new(password_db[0][0]) == @password_login
            puts "logged in"
            session[:user] = true
            
            #I've added these so that we can access all information from the other pages (probably will be helpful when doing profile/admin changes/orders for a postcode)
            session[:username] = @username_login
            session[:password] = password_db[0][0]
            user_info = @database.execute('SELECT * FROM users WHERE username = ?', [@username_login])
            session[:email] = user_info[0][6]
            session[:address] = user_info[0][7]
            session[:postcode] = user_info[0][8]
            session[:twittername] = user_info[0][4]
            session[:firstname] = user_info[0][1]
            session[:lastname] = user_info[0][2]
            session[:phone] = user_info[0][9]
            session[:id] = user_info[0][0]
            
            if user_info[0][10] == 1 then
                session[:admin] = true
            elsif user_info[0][10] == 2 then
                session[:order_handler] = true
            end
            redirect '/'
        else
            @wrong_password = true
            erb :sign_in
        end
        erb :sign_in
    end
    if !@login_all_ok
        @empty_fields=true
        erb :sign_in
    end
    erb :sign_in
    
end

get '/sign_out' do
    session.clear
    puts "logged out"
    redirect '/'
end
