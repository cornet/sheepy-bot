#!/usr/bin/env ruby

require 'yaml'
require 'cinch'
require './lib/config.rb'
Dir["./plugins/*.rb"].each {|file| require file }


config = Conf.new(YAML.load_file("./config/config.yaml"))

p config

sheepy = Cinch::Bot.new do
  configure do |c|
    c.server          = config.bot.server
    c.port            = config.bot.port
    c.nick            = config.bot.nick
    c.channels        = config.bot.channels
    c.verbose         = config.bot.verbose
    c.plugins.plugins = [Help, Google, Youtube]
  end

  on :message, "hello" do |m|
    m.reply "Hello #{m.user.nick}"
  end
end

sheepy.start
