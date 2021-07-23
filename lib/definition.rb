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

end
