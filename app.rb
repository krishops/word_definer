require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')
require 'pry'

get('/') do
  @words = Word.all
  erb(:word_definer)
end

get('/words') do
  @words = Word.all
  erb(:word_definer)
end

get('/word/new') do
  erb(:new_word)
end

post('/words') do
  word = params[:new_word]
  new_word = Word.new(word, nil)
  new_word.save()
  @words = Word.all()
  erb(:word_definer)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word_info)
end
