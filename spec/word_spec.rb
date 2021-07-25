require('rspec')
require('word')
require('definition')
require('pry')

describe '#Word' do

  before(:each) do
    Word.clear()
    Definition.clear()
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

  describe('#update_word') do
    it("updates a word's name by id") do
      word = Word.new("Unicorn", nil)
      word.save()
      word.update_word("Mermaid")
      expect(word.word).to(eq("Mermaid"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("Unicorn", nil)
      word.save()
      word2 = Word.new("Pegasus", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word = Word.new("Unicorn", nil)
      word.save()
      definition = Definition.new("Mythical creature", word.id, nil)
      definition.save()
      definition2 = Definition.new("Something difficult to obtain", word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end
end