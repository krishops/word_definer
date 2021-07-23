require('rspec')
require('word')
require('pry')

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Unicorn")
      word.save()
      word2 = Word.new("Pegasus")
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Unicorn")
      word2 = Word.new("Unicorn")
      expect(word).to(eq(word2))
    end
  end

  

end