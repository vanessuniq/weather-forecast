require "bundler/setup"
Bundler.require

require 'dotenv'
Dotenv.load
require 'tty-prompt'
require 'httparty'
require 'json'
require 'terminal-table'
require 'colorize'
require 'ruby_figlet'
require 'forecast/version'
require 'forecastapi.rb'
require 'forecastcli.rb'
require 'forecast.rb'
