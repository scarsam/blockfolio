require 'rails_helper'

describe User, type: :model do
  context "When creating a new user" do
    it "should return valid" do
      user = User.create(
        email: 'sam@ojling.com',
        password: 'test123'
      )
      expect(user).to be_valid
    end
  end
  context "When creating an invalid User" do
    it "should return invalid" do
      user = User.create(
        email: '',
        password: 'test123'
      )
      expect(user).to be_invalid
    end
  end
  context "When creating an invalid email for User" do
    it "should return invalid" do
      user = User.create(
        email: 'test@test',
        password: 'test123'
      )
      expect(user).to be_invalid
    end
  end
  context "When creating a new user with 2 portfolios" do
    it "should contain 2 portfolios" do
      user = User.create(
        email: 'sam@ojling.com',
        password: 'hello123'
      )
      user.portfolios.create(name: 'Sam Portfolio 1')
      user.portfolios.create(name: 'Sam Portfolio 2')
      expect(user.portfolios.count).to eq(2)
    end
  end
end