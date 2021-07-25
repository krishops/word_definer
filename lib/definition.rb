class Definition
  attr_reader :id
  attr_accessor :entry, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(entry, word_id, id)
    @entry = entry
    @word_id = word_id
    @id = id || @@total_rows +=1
  end

  def ==(entry_to_compare)
    (self.entry() == entry_to_compare.entry()) && (self.word_id() == entry_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.entry, self.word_id, self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def update_entry(entry, word_id)
    self.entry = entry
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.entry, self.word_id, self.id)
  end

  def word
    Word.find(self.word_id)
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def delete
    @@definitions.delete(self.id)
  end
end
