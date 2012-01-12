require "spec_helper"
require "./plugins/imdb.rb"

describe IMDb do
  describe "search" do
    it "should return a imdb url" do
      IMDb.search("The Matix").should =~ /^The Matrix - [0-9]\.[0-9]\/10 - http:\/\/www.imdb.com\/title\/tt0133093$/
    end
  end
end
