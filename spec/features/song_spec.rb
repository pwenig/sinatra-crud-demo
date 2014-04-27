require 'spec_helper'

feature 'Managing Song Lists' do
  scenario 'User creates and delete a list of songs' do
    visit '/'
    click_on 'Add New Song'
    fill_in 'song_title', with: "Sympathy for the Devil"
    fill_in 'song_album', with: "Let it Bleed"
    fill_in 'song_date_of_release', with: "1969"
    click_on 'Add'
    expect(page).to have_content "Sympathy for the Devil"
    click_on 'Sympathy for the Devil'
    click_on 'Delete'
    expect(page).to have_no_content "Sympathy for the Devil"
  end
scenario 'User can edit a song' do
  visit '/'
  click_on 'Add New Song'
  fill_in 'song_title', with: "Sympathy for the Devil"
  fill_in 'song_album', with: "Let it Bleed"
  fill_in 'song_date_of_release', with: "1969"
  click_on 'Add'
  expect(page).to have_content "Sympathy for the Devil"
  click_on 'Sympathy for the Devil'
  click_on 'Edit'
  fill_in 'song_title', with: "You Can't Always Get What You Want"
  click_on 'Edit Song'
  expect(page).to have_content "You Can't Always Get What You Want"
end
end