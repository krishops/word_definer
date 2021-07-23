require('rspec')
require('word')
require('definition')
require('pry')

describe '#Defintion' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Unicorn", nil)
    @word.save()
  end

  describe('.all') do
    it("returns all definitions for a give word") do
      definition = Definition.new("Mythical creature", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Something difficult to obtain", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Mythical creature", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("Mythical creature", @word.id, nil)
      definition2 = Definition.new("Mythical creature", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("Mythical creature", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Something difficult to obtain", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update_entry') do
    it("updates a definition entry by id") do
      definition = Definition.new("Mythical creature", @word.id, nil)
      definition.save()
      definition.update_entry("Something difficult to obtain", @word.id)
      expect(definition.entry).to(eq("Something difficult to obtain"))
    end
  end



end