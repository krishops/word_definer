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
      word = Word.new("Unicorn", nil)
      word.save()
      word2 = Word.new("Pegasus", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Unicorn", nil)
      word2 = Word.new("Unicorn", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Unicorn", nil) 
      word.save()
      word2 = Word.new("Pegasus", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update_name') do
    it("updates an word name by id") do
      word = Word.new("Unicorn", nil)
      word.save()
      word.update_name("Mermaid")
      expect(word.name).to(eq("Mermaid"))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new("Unicorn", nil)
      word.save()
      word2 = Word.new("Pegasus", nil)
      word2.save()
      word.delete()
      expect(word.all).to(eq([word2]))
    end
  end

  

end