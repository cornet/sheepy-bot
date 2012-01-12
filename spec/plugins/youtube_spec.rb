require "spec_helper"
require "./plugins/youtube.rb"

describe Youtube do
  describe "search" do
    it "should return a youtube result" do
      Youtube.search("cows").should =~ /^.* : http:\/\/www.youtube.com\/.*$/
    end
  end
end

