require 'rails_helper'

describe Portfolio, type: :model do
  context "created with a name and user" do
    it "should return valid" do
      user = User.create(
        email: 'sam@ojling.com',
        password: 'test123'
      )
      portfolio = Portfolio.new(name: 'Sam Portfolio 3')
      user.portfolios << portfolio
      user.save
      expect(portfolio).to be_valid
    end
  end
  context "created without a name" do
    it "should return invalid" do
      user = User.create(
        email: 'sam@ojling.com',
        password: 'test123'
      )
      portfolio = Portfolio.new
      user.portfolios << portfolio
      user.save
      expect(portfolio).to be_invalid
    end
  end
  context "created two portfolios with the same name" do
    it "should return invalid" do
      user = User.create(
        email: 'sam@ojling.com',
        password: 'test123'
      )
      user.portfolios.create(name: 'Same name')
      portfolio2 = Portfolio.new(name: 'Same name')
      user.portfolios << portfolio2
      user.save
      expect(portfolio2).to be_invalid
    end
  end
end