#load sinatra
require 'rubygems'
require 'sinatra/base'
require 'sinatra/contrib'

#require global dependencies
require 'data_mapper'
require 'json'

#load api module
Dir[File.dirname(__FILE__) + '/api/helpers/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/api/controllers/*.rb'].each {|file| require file}

#load web module
Dir[File.dirname(__FILE__) + '/web/helpers/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/web/controllers/*.rb'].each {|file| require file}

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
map('/api/records') {run RecordsController}
map('/') {run WebController}
