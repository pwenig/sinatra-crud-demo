require 'spec_helper'

feature 'Managing People' do
  scenario 'User creates and edits and deletes a person' do
    visit '/'
    click_on "People"
    click_on "Add New Person"
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Johnson"
    fill_in "Date of birth", with: "2014-04-12"
    click_on "Create Person"
    expect(page).to have_content("Joe")
    expect(page).to have_content("Johnson")
    expect(page).to have_content("4/12/2014")

    click_on "Joe"
    expect(page).to have_content("Joe")
    expect(page).to have_content("Johnson")
    expect(page).to have_content("4/12/2014")

    click_on "Edit"
    fill_in "First name", with: "Joseph"
    fill_in "Last name", with: "Jenkins"
    fill_in "Date of birth", with: "2014-05-12"
    click_on "Update Person"

    expect(page).to have_no_content("Joe")
    expect(page).to have_no_content("Johnson")
    expect(page).to have_no_content("4/12/2014")

    expect(page).to have_content("Joseph")
    expect(page).to have_content("Jenkins")
    expect(page).to have_content("5/12/2014")

    click_on "Delete"
    expect(page).to have_no_content("Joseph")
    expect(page).to have_no_content("Jenkins")
    expect(page).to have_no_content("5/12/2014")
  end
end