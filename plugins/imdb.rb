require 'filmbuff'

class IMDb
  include Cinch::Plugin
  plugin "imdb"
  help "!imdb <title> - Search for file <title>"

  match /imdb (.+)/i

  def initialize(*args)
    super

  end

  def self.search(title)
    @imdb = FilmBuff::IMDb.new
    # imdb.locale = config[:locale] if config[:locale]

    movie = @imdb.find_by_title(title)

    "#{movie.title} - #{movie.rating}/10 - http://www.imdb.com/title/#{movie.imdb_id}"
  end

  def execute(m, title)
    m.reply(self.class.search(title))
  end

end
