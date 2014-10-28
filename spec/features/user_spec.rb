require 'spec_helper'
feature "Creating a User" do
  it "can try to register" do
    visit "http://localhost:3000/users"
    click_link 'REGISTER'
    page.should have_content 'Username'
    page.should have_content 'Choose password'
  end

  it "can register" do
    visit "/users"
    click_link 'REGISTER'
    fill_in 'Username', with: 'La di da'
    fill_in 'Choose password', with: 'hu di ha'
    click_button 'Register'
    page.should have_content 'La di da'
  end

  it "checks to make sure password field was filled out" do
    visit "/users"
    click_link 'REGISTER'
    fill_in 'Username', with: 'Bididi bop'
    click_button 'Register'
    page.should have_content 'Password field empty'
  end
end

feature "Logging in" do
  it "can try to log in" do
    visit "http://localhost:3000/users"
    click_link 'LOGIN'
    page.should have_content 'Username'
    page.should have_content 'Password'
  end
end
