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

get('/word/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/word/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update_word(params[:update_word])
  @words = Word.all
  erb(:word_definer)
end

delete('/word/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

post('/word/:id/definition') do
  @words = Word.all()
  @word = Word.find(params[:id].to_i())
  new_definition = Definition.new(params[:new_definition], @word.id, nil)
  new_definition.save()
  erb(:word_info)
end

get('/word/:id/definition/:entry_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:entry_id].to_i())
  erb(:edit_def)
end

patch('word/:id/definition/:entry_id') do
  @word = Word.find(params[:id].to_i())
  @defintion = Definition.find(params[:entry_id].to_i())
  definition.update_entry(params[:new_def], @word.id)
  @definitions = Definition.all
  redirect to('/word/:id')
end
  
