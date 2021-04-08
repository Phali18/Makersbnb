require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/property'
require './lib/user'

class MakersBnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/test' do
    'This is a test page!'
  end

  get '/properties' do
    @properties = Property.all
    erb :"properties/index"
  end

  get '/properties/new' do
    "devine lounge"
    erb :'properties/new'
  end

  post '/properties' do
    Property.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/properties'
  end

  get '/' do 
    erb :'properties/homepage'
  end 

  post '/users' do 
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/properties'
  end

  get '/sessions/new' do
    erb :'properties/users'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/properties')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do 
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end
  
  get '/properties/:id' do
    @property = Property.find(params[:id])
    erb :'properties/show' 
  end

  run! if app_file == $0
end
