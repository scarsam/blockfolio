require 'rails_helper'

describe Coin, type: :model do
  context "is pulling coin data from external API" do
    it "should return valid" do
      coin = Coin.find_by(name: 'Bitcoin')
      expect(coin).to be_valid
    end
  end
end