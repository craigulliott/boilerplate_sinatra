#!/usr/bin/env ruby

# Libraries:::::::::::::::::::::::::::::::::::::::::::::::::::::::
require 'rubygems'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'coffee-script'

# Application:::::::::::::::::::::::::::::::::::::::::::::::::::
class ScssHandler < Sinatra::Base
    
  set :views, File.dirname(__FILE__) + '/app/styles'

  get '/css/*.css' do
    filename = params[:splat].first
    scss filename.to_sym
  end
    
end

class CoffeeHandler < Sinatra::Base
  
  set :views, File.dirname(__FILE__) + '/app/scripts'

  get "/js/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
  
end

class MyApp < Sinatra::Base
  
  use ScssHandler
  use CoffeeHandler

  # Configuration:::::::::::::::::::::::::::::::::::::::::::::::
  set :public, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/app/views'

  # Route Handlers::::::::::::::::::::::::::::::::::::::::::::::
  get '/' do
    slim :index
  end

end

if __FILE__ == $0
    MyApp.run! :port => 4567
end