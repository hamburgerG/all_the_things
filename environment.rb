require 'sinatra'
require 'sinatra/mongomapper'
require 'nokogiri'
require 'open-uri'
require 'pry'

Dir[File.dirname(__FILE__) + '/extensions/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file}                 
Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each {|file| require file}                 
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file}                 
Dir[File.dirname(__FILE__) + '/before_hooks/*.rb'].each {|file| require file}

MongoMapper.connection = Mongo::Connection.new("127.0.0.1", 27017, :pool_size => 60, :pool_timeout => 60)
MongoMapper.database = "all_the_things"

helpers EngineHelper