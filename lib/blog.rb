require 'sinatra/base'

class Blog < Sinatra::Base
  set :root, File.expand_path('../..', __FILE__)
end
