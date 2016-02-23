require 'sinatra/base'

require_relative '../models/user'

class Chitter < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    erb(:'home')
  end

  post '/users' do
    @user = User.create()
    redirect '/'
  end

  run! if app_file == $0
end
