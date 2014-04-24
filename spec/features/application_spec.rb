require 'spec_helper'

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end
end