require 'rspec'
require_relative 'max_stock_price'

RSpec.describe MaxStockPrice, "#get_max_profit" do
  context "The lowest price comes before the highest price" do

    it "solves the most simple case" do
      expect(MaxStockPrice.get_max_profit([1,2,3,4,5])).to eq 4
    end

    it "solves a slightly more complex case" do
      expect(MaxStockPrice.get_max_profit([4,1,2,23,12,5,9,19,20,15])).to eq 22
    end
  end

  context "The lowest price comes after the highest price" do

    it "returns the smallest loss if no profit is possible" do
      expect(MaxStockPrice.get_max_profit([5,4,3,2,1])).to eq -1
    end

    it "returns the smallest loss if no profit is possible 2" do
      expect(MaxStockPrice.get_max_profit([5,4,4,3,1])).to eq 0
    end

    it "finds the correct profit if min/max doesn't work" do
      expect(MaxStockPrice.get_max_profit([10, 14, 13, 9, 17, 7, 10, 11, 13])).to eq 8
    end

  end

  context "All the prices are the same" do
    it "returns 0" do
      expect(MaxStockPrice.get_max_profit([5,5,5,5,5])).to eq 0
    end
  end

end
