require 'sinatra'
require 'twitter'
require 'sqlite3'
require 'bcrypt'
require 'mail'

include ERB::Util
set :bind, '0.0.0.0'


require_relative 'front_end'
require_relative 'error_handling'
require_relative 'tweet_database'
require_relative 'login_database'
require_relative 'menu_database'
#require_relative 'follow_tweeters'
require_relative 'administrator'
require_relative 'order_handler'



