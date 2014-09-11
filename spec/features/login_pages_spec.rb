require 'spec_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(name: 'user', email: 'user@example.com', password: 'password')
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content 'Log Out'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(email: 'user@example.com', password: 'password')
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'wrong'
    click_button 'Login'
    expect(page).to have_content 'Log In'
  end
end
