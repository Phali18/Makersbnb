require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/property.rb'


class MakersBnb < Sinatra::Base
  
  get '/test' do 
    'This is a test page!'
  end

  get '/properties' do
    @properties = Property.all
    erb :"properties/index"
  end



  run! if app_file == $0
end
