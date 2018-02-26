require 'rails_helper'

describe "the user signin process", type: :feature do
  before do
    @user = User.create(email: 'user@test.com', password: 'test123')
  end
  it "signs in the user" do
    visit login_path
    expect(page).to have_content 'Login form'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Login'
    expect(page).to have_content 'Welcome to BlockFolio'
  end
end
