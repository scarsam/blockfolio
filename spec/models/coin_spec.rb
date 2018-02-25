require 'rails_helper'

describe Coin, type: :model do
  context "is pulling coin data from external API" do
    it "should return valid coin" do
      coin = Coin.find_by(name: 'Bitcoin')
      expect(coin).to be_valid
    end
  end
  context "is pulling none existing coin from external API" do
    it "should return invalid coin" do
      coin = Coin.find_by(name: 'No coin')
      expect(coin).to be_nil
    end
  end
end