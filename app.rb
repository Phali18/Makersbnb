require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/property'


class MakersBnb < Sinatra::Base

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

  get '/properties/:id' do
    @property = Property.find(params[:id])
    erb :'properties/show' 
  end

  run! if app_file == $0
end
