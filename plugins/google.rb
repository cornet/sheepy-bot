require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'

class Google
  include Cinch::Plugin
  plugin "google"
  help "!google <query> - Search google for <query>"

  match /google (.+)/

  def self.search(query)
    url = "http://www.google.com/search?q=#{CGI.escape(query)}"
    res = Nokogiri::HTML(open(url)).at("h3.r")

    title = res.text
    link = res.at('a')[:href]
    CGI.unescape_html "#{title} : #{link}"
  rescue Exception => e
    e.message
  end

  def execute(m, query)
    m.reply(self.class.search(query))
  end
end

