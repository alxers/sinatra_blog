require 'sinatra'
require 'pry'

require_relative 'app/models/post'
require_relative 'app/controllers/application_controller'


configure do
  set :views, "#{File.dirname(__FILE__)}/app/views"
  set :show_exceptions, :after_handler
end
