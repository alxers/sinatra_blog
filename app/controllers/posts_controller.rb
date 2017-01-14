class PostsController < ApplicationController
  get '/' do
    erb :index
  end
end
