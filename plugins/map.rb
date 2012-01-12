require 'cinch'
require 'open-uri'
require 'cgi'

class Map
  include Cinch::Plugin
  plugin "map"
  help "!map <query> - Search google maps for <query>"

  match /map (.+)/

  def self.search(query)
    url = "http://map.google.com/maps?q=#{CGI.escape(query)}"
    url
  end

  def execute(m, query)
    m.reply(self.class.search(query))
  end
end

