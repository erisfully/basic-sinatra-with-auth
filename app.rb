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

  post '/' do
    flash.now[:notice] = "Thanks for signing up!"
    erb :homepage
  end

  post '/login' do
    redirect('/home')

  end

  get '/home' do
    erb :userhome
  end




end



