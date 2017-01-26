require 'sinatra/base'
require 'time'

class GithubHook < Sinatra::Base

  def self.parse_git
    sha1, date = `git log HEAD~1..HEAD --pretty=format:%h^%ci`.strip.split('^')
    set :commit_hash, sha1
    set :commit_date, Time.parse(date)
  end

  post '/update' do
    app.settings.reset!
    load app.settings.app_file

    content_type :txt
    if settings.autopull?
      `git pull 2>&1`
    else
      'ok'
    end
  end
end
