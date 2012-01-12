require 'sinatra'

class WebServer < Sinatra::Base
  get '/' do

    $config.bot.channels.each do |channel|
      $sheepy.Channel(channel).send "hello"
    end

    "Hello From Sheepy"

  end
end
