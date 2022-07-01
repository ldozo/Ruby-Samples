require 'bundler'
Bundler.require

require 'ideabox/db_config'

environment = ENV.fetch('RACK_ENV') {'development'}

config = DBConfig.new(environment).options
ActiveRecord::Base.establish_connection(config)

require 'ideabox'