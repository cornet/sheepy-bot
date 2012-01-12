require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'

class Youtube
  include Cinch::Plugin
  plugin "youtube"
  help "!youtube <query> - Search Youtube for <query>"
  match /youtube (.+)/

    def self.search(query)
      url = "http://www.youtube.com/results?q=#{CGI.escape(query)}"
      doc = Nokogiri::HTML(open(url))

      res = doc.css('div#search-results div.result-item-main-content')[0]

      title = res.at('h3').text
      link = "http://www.youtube.com#{res.css('a')[2][:href]}"
      CGI.unescape_html "#{title} : #{link}"
    rescue
      "No results found"
    end

  def execute(m, query)
    m.reply(self.class.search(query))
  end
end

