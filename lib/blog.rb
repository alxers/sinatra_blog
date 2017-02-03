require 'sinatra/base'
require 'ostruct'
require 'time'
require 'pry'

class Blog < Sinatra::Base
  set :root, File.expand_path('../..', __FILE__)
  set :articles, []

  Dir.glob "#{root}/articles/*.md" do |file|
    # Parse metadata and content from file
    content = File.read(file)

    # Generate metadata object
    article = OpenStruct.new

    # Correct filename example: article_title.31012017.md
    filename = file.match(%r{[^\/]+$})[0]
    article.title, article.date, article.ext = filename.split('.')
    article.content = content
    article.slug = File.basename(file, article.ext)

    get "/#{article.slug}" do
      erb :post, locals: { article: article }
    end

    articles << article
  end

  articles.sort_by!(&:date)
  articles.reverse!

  get '/' do
    erb :index
  end
end
