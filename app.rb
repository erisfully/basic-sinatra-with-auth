require "sinatra"
require "rack-flash"

require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  get '/' do
    erb :homepage
  end

  get '/register' do
    erb :registration
  end

  post '/register' do
   :username == params[:username]
   :password == params[:password]
   @user_database.insert({username: params[:username], password: params[:password]})
    redirect'/'
  end

  post '/' do
    flash.now[:notice] = "Thanks for signing up!!"
    erb :homepage
  end

  get '/login' do
    redirect'/home'
  end

  get '/home' do
    erb :userhome
  end

end



