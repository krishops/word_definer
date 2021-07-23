require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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
  it('creates a word and then goes to the word page') do
    pegasus = Word.new("Pegasus", nil)
    pegasus.save()
    visit("/word/#{pegasus.id}")
    fill_in('new_definition', :with => 'Winged Horse')
    click_on('Add')
    expect(page).to have_content('Winged Horse')
  end
end