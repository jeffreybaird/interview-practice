require 'rspec'
require_relative 'coin'

RSpec.describe Coin do
  context "can give all possibilities" do
    it "handles the simple case" do
      expect(Coin.all_possible(4, [1,2,3])).to eq [[1,1,1,1], [1,1,2], [1,3], [2,2]]
    end
  end
end
