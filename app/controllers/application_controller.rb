class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  not_found do
    title 'Not Found!'
    erb :not_found
  end

  get '/' do
    erb :index
  end
end
