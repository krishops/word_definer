require('capybara/rspec')
require('./app')
require('word')
require('definition')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before(:each) do
  Word.clear()
  Definition.clear()
end

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    Word.clear()
    visit('/words')
    click_on('Add a new word')
    fill_in('new_word', :with => 'Pegasus')
    click_on('Go!')
    expect(page).to have_content('Pegasus')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and adds it to the word page') do
    Word.clear()
    pegasus = Word.new('Pegasus', nil)
    pegasus.save()
    visit("/word/#{pegasus.id}")
    fill_in('new_definition', :with => 'Winged Horse')
    click_on('Add')
    expect(page).to have_content('Winged Horse')
  end
end

describe('update a word path', {:type => :feature}) do
  it('updates a word and then goes to the main page') do
    Word.clear()
    pegasus = Word.new('Pegasus', nil)
    pegasus.save()
    visit("/word/#{pegasus.id}")
    visit("/word/#{pegasus.id}/edit")
    fill_in('update_word', :with => 'Unicorn')
    click_on('Update')
    expect(page).to have_content('Unicorn')
  end
end

describe('update a definition path', {:type => :feature}) do
  it('updates a word and then goes to the main page') do
    Word.clear()
    pegasus = Word.new('Pegasus', nil)
    pegasus.save()
    pegasus_def = Definition.new('Winged Horse', pegasus.id, nil)
    pegasus_def.save()
    visit("/word/#{pegasus.id}/definition/#{pegasus_def.id}")
    fill_in('new_def', :with => 'Hercules steed')
    click_on('Update')
    expect(page).to have_content('Hercules steed')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word and then goes to the main page') do
    Word.clear()
    pegasus = Word.new('Pegasus', nil)
    pegasus.save()
    unicorn = Word.new('Unicorn', nil)
    unicorn.save()
    visit("/word/#{pegasus.id}")
    visit("/word/#{pegasus.id}/edit")
    click_on('Delete word')
    expect(page).to have_no_content('Pegasus')
  end
end

describe('delete a definition path', {:type => :feature}) do
  it('updates a word and then goes to the main page') do
    Word.clear()
    Definition.clear()
    pegasus = Word.new('Pegasus', nil)
    pegasus.save()
    pegasus_def1 = Definition.new('Winged Horse', pegasus.id, nil)
    pegasus_def1.save()
    pegasus_def2 = Definition.new('Hercules Steed', pegasus.id, nil)
    pegasus_def2.save()
    visit("/word/#{pegasus.id}/definition/#{pegasus_def1.id}")
    click_on('Delete Definition')
    expect(page).to have_no_content('Winged Horse')
  end
end

