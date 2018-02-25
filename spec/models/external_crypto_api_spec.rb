require 'rails_helper'

describe ExternalCryptoApi, type: :model do
  context "is getting an response from HTTParty" do
    it "should return an object" do
      hashes = ExternalCryptoApi.call
      expect(hashes.any? { |hash| hash['id'] == 'bitcoin' }).to be_truthy
    end
  end
end