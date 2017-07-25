#load sinatra
require 'rubygems'
require 'sinatra/base'
require 'sinatra/contrib'

#require global dependencies
require 'data_mapper'
require 'json'

#load main controller
Dir[File.dirname(__FILE__) + '/main.rb'].each {|file| require file}

#load api module
Dir[File.dirname(__FILE__) + '/api/helpers/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/api/controllers/*.rb'].each {|file| require file}

#load models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file}

#Setup Database
if ENV['RACK_ENV'] == 'development' 
	DataMapper.setup(:default, "postgres://sinatra_dev:developer@127.0.0.1/sinatra_db")
elsif ENV['RACK_ENV'] == 'heroku'
	DataMapper.setup(:default, ENV['DATABASE_URL'])
end
DataMapper.finalize.auto_upgrade!

#map controllers
map('/') {run MainController}
map('/api/records') {run RecordsController}
