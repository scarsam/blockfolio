describe Portfolio do
  let(:attributes) do
    {
      name: 'My portfolio'
    }
  end

  it "is considered valid" do
    expect(Portfolio.new(attributes)).to be_valid
  end
end