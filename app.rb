require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/property'


class MakersBnb < Sinatra::Base

  get '/test' do
    'This is a test page!'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  post '/properties' do
    Property.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/properties'
  end


  run! if app_file == $0
end
