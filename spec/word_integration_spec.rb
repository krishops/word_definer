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