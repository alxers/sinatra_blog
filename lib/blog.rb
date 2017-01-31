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
    article.date = file.split('.')[-2]
    article.title = file.split('.')[0..-3].join('.')

    article.date = Time.parse article.date.to_s
    article.slug = File.basename(file, '.md')

    get "/#{article.slug}" do
      erb :post, locals: { article: article }
    end

    articles << article
  end

  articles.sort_by! { |article| article.date }
  articles.reverse!

  get '/' do
    erb :index
  end
end
