require 'cinch'

class Log
  include Cinch::Plugin
  plugin "log"

  listen_to :channel

  def initialize(*args)
    super
    @log = {}
    $config.bot.channels.each do |chan|
      puts chan
      @log[chan] = File.open("#{$config.log.dir}/#{chan}.log", "a")
    end
  end

  def listen(m)
    @log[m.channel].write("#{Time.now} <#{m.user}> #{m.message}")
    @log[m.channel].flush 
  end

end

