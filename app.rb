require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/property'
require './lib/user'
require './lib/booking_request'

class MakersBnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/test' do
    'This is a test page!'
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

  get '/properties' do
    @properties = Property.all
    erb :"properties/index"
  end

  get '/properties/new' do
    if session[:user_id] != nil
      erb :'properties/new'
    else
      flash[:error] = "You are not signed in."
      redirect('/')
    end
  end
  
   post '/properties' do
    Property.create(name: params[:name], description: params[:description], price: params[:price], user_id: session[:user_id])
    redirect '/properties'
  end

  get '/properties/:id' do
    @property = Property.find(id: params[:id])
    erb :'properties/show' 
  end
  
  get '/properties/:id/edit' do
    @property = Property.find(id: params[:id]) 
    erb :'properties/edit'
  end

  post '/properties/:id' do
    Property.update(id: params[:id], name: params[:name], description: params[:description], price: params[:price])
    redirect('/properties')
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  post '/requests' do
    @booking_details = BookingRequest.create(user_id: session[:user_id], property_id: params[:property_id].to_i, booking_details: params[:booking_details])
    @property = Property.find(id: params[:property_id].to_i)
    erb :'/properties/requests'
  end

  run! if app_file == $0
end
