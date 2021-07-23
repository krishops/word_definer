require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before(:each) do
  Word.clear()
end

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('new_word', :with => 'Pegasus')
    click_on('Go!')
    expect(page).to have_content('Pegasus')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and adds it to the word page') do
    pegasus = Word.new("Pegasus", nil)
    pegasus.save()
    visit("/word/#{pegasus.id}")
    fill_in('new_definition', :with => 'Winged Horse')
    click_on('Add')
    expect(page).to have_content('Winged Horse')
  end
end

describe('update a word path', {:type => :feature}) do
  it('updates a word and then goes to the main page') do
    pegasus = Word.new("Pegasus", nil)
    pegasus.save()
    visit("/word/#{pegasus.id}")
    visit("/word/#{pegasus.id}/edit")
    fill_in('update_word', :with => 'Unicorn')
    click_on('Update')
    expect(page).to have_content('Unicorn')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word and then goes to the main page') do
    pegasus = Word.new("Pegasus", nil)
    pegasus.save()
    unicorn = Word.new("Unicorn", nil)
    unicorn.save()
    visit("/word/#{pegasus.id}")
    visit("/word/#{pegasus.id}/edit")
    click_on('Delete word')
    expect(page).to have_no_content("Pegasus")
  end
end