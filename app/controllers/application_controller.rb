class App < Sinatra::Application
  get '/' do
    erb :post
  end
end
