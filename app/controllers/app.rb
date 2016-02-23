require 'sinatra/base'

require_relative '../../data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    erb(:'/home')
  end

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  post '/sessions' do
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb(:'/users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'/peeps/index')
  end

  post '/peeps' do
    @peep = Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps/new' do
    @peep = Peep.new
    erb(:'/peeps/new')
  end

  run! if app_file == $0
end
