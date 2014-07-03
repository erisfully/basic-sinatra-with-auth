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
   @user_database.insert({username: params[:username], password: params[:password]})
   flash[:notice] = "Thanks for signing up!!"
    redirect'/'
  end



  post '/home' do
    # "Welcome #{params[:username]}"
    erb :userhome
  end

  # post "/login" do
      # params[:username]
      # params[:password]
  # if database has user with that name
    # take them to login in homepage
  # if no user with that name in db
    # stay on login page and display error
  # if user with name exists in db but wrong password
    # display pw error
  # end
end



