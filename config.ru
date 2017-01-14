require 'sinatra/base'
require 'pry'

# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }

# map the controllers to routes
map('/post') { run PostsController }
map('/') { run ApplicationController }
