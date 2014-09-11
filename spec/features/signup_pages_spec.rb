require 'spec_helper'

describe "the signup process" do
  it "signs a user in who uses the right parameters" do
    visit '/users/new'

    fill_in 'Name', with: 'Name'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Submit'
    expect(page).to have_content 'Log Out'
  end

  it "gives a user an error who uses the wrong paramaters" do
   visit '/users/new'

    fill_in 'Name', with: ''
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Submit'
    expect(page).to have_content 'Log In'
  end
end
