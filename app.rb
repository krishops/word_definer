require('sinatra')
require('sinatra/reloader')
require('./lib/word')
also_reload('lib/**/*.rb')
require 'pry'