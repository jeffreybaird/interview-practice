require 'rspec'
require_relative 'products_of_ints'

RSpec.describe ProductsOfInts, "#get_products_of_all_ints_except_at_index" do
  context "mutiplies all ints" do
    it "does the thing" do
      expect(ProductsOfInts.get_products_of_all_ints_except_at_index([1,2,3,4])).to eq([24,12,8,6])
    end

    it "does the thing even if all the numbers are the same" do
      expect(ProductsOfInts.get_products_of_all_ints_except_at_index([2,2,2,2])).to eq([8,8,8,8])
    end
  end
end
