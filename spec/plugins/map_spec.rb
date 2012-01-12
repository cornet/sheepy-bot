require "spec_helper"
require "./plugins/map.rb"

describe Map do
  describe "search" do
    it "should return a link" do
      Map.search("SW1A 1AA").should =~ /^.*http:\/\/map.google.com\/maps\?q=SW1A\+1AA$/
    end
  end
end
