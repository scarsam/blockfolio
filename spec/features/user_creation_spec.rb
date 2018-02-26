require 'rails_helper'

describe "the user creation process", type: :feature do
  before do
    visit root_path
    fill_in 'email', with: 'Test@user.com'
    fill_in 'password', with: 'test123'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome to BlockFolio'
  end
end
