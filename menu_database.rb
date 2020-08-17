require 'sinatra'
require 'twitter'
require 'sqlite3'

include ERB::Util
set :bind, '0.0.0.0'

before do
    @menu = SQLite3::Database.new 'menu.sqlite3'
    if session[:location] == nil
        session[:location] = "sheffield"
    end
end


get '/menu' do
    @table = @menu.execute('SELECT * FROM menu_items')
    @table_london = @menu.execute('SELECT * FROM menu_items_london')
    erb :menu
end

post '/menu' do
    @table = @menu.execute('SELECT * FROM menu_items')
    @table_london = @menu.execute('SELECT * FROM menu_items_london')
    session[:location] = params[:location].downcase
    erb :menu
end

get '/menu_sides' do 
    @sides_table =@menu.execute('SELECT * FROM side_items')
    @sides_london_table =@menu.execute('SELECT * FROM side_items_london')
    erb :menu_sides
end

post '/menu_sides' do 
    @sides_table =@menu.execute('SELECT * FROM side_items')
    @sides_london_table =@menu.execute('SELECT * FROM side_items_london')
    session[:location] = params[:location].downcase
    erb :menu_sides
end

get '/menu_desserts' do 
    @dessert_table =@menu.execute('SELECT * FROM dessert_items')
    @dessert_london_table =@menu.execute('SELECT * FROM dessert_items_london')
    erb :menu_desserts
end

post '/menu_desserts' do 
    @dessert_table =@menu.execute('SELECT * FROM dessert_items')
    @dessert_london_table =@menu.execute('SELECT * FROM dessert_items_london')
    session[:location] = params[:location].downcase
    erb :menu_desserts
end

get '/menu_drinks' do 
    @drink_table =@menu.execute('SELECT * FROM drink_items')
    @drink_london_table =@menu.execute('SELECT * FROM drink_items_london')
    erb :menu_drinks
end

post '/menu_drinks' do 
    @drink_table = @menu.execute('SELECT * FROM drink_items')
    @drink_london_table =@menu.execute('SELECT * FROM drink_items_london')
    session[:location] = params[:location].downcase
    erb :menu_drinks
end