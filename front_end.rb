require 'sinatra'


enable :sessions
 set :session_secret, 'super secret'

# email is:         pizzashedsheffield@gmail.com
# password is:      pizzashedpass

get '/' do
  erb :index
end

get '/tweets' do
    erb :tweets
end

get '/profile' do
    @submitted_change = false
    erb :profile
end

post '/profile' do
    @submitted_change = true

    @password_change = params[:password_change].strip
    session[:password] = @password_change
    @email_change = params[:email_change].strip
    session[:email] = @email_change
    @address_change = params[:address_change].strip
    session[:address] = @address_change
    @postcode_change = params[:postcode_change].strip
    session[:postcode] = @postcode_change
    @phone_change = params[:phone_change].strip
    session[:phone] = @phone_change
    @twittername_change = params[:twittername_change].strip
    session[:twittername] = @twittername_change

    # Validation
    @password_change_ok = !@password_change.nil? && @password_change != ""
    @email_change_ok = !@email_change.nil? && @email_change != ""
    @address_change_ok = !@address_change.nil? && @address_change != ""
    @postcode_sheff_change_ok = /([Ss]([1-9])|([1][0-4]))([0-9][a-zA-Z]{2})/.match("#{@postcode_change}")
    @postcode_lon_change_ok = /(GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKPSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY])))) [0-9][A-Z-[CIKMOV]]{2})/.match("#{@postcode_change}")
    @postcode_change_ok = @postcode_sheff_change_ok || @postcode_lon_change_ok
    @phone_change_ok = /07[0-9]{8}/.match("#{@phone_change}")
    @twittername_change_ok = !@twittername_change.nil? && @twittername_change != ""

    @all_change_ok = @password_change_ok && @email_change_ok && @address_change_ok && @postcode_change_ok && @phone_change_ok && @twittername_change_ok

    #adding the data to the database
    if @all_change_ok
        @database = SQLite3::Database.new "database.sqlite3"
        #do the change
        @database.execute( "UPDATE users SET password = '#{@password_change}' WHERE ID = #{session[:id]};")
        @database.execute( "UPDATE users SET email = '#{@email_change}' WHERE ID = #{session[:id]};")
        @database.execute( "UPDATE users SET address = '#{@address_change}' WHERE ID = #{session[:id]};")
        @database.execute( "UPDATE users SET postcode = '#{@postcode_change}' WHERE ID = #{session[:id]};")
        @database.execute( "UPDATE users SET phone = '#{@phone_change}' WHERE ID = #{session[:id]};")
        @database.execute( "UPDATE users SET twittername = '#{@twittername_change}' WHERE ID = #{session[:id]};")
    end

    erb :profile

end
