require 'sinatra'

class WebServer < Sinatra::Base
  get '/' do
    "Hello From Sheepy"
    $sheepy.Channel("#sheepy").send "hello"
  end
end
