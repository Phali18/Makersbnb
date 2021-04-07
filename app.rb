require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'


class MakersBnb < Sinatra::Base
  
  get '/test' do 
    'This is a test page!'
  end


  run! if app_file == $0
end
