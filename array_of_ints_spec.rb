require 'rspec'
require_relative 'array_of_ints'

RSpec.describe "ArrayOfInts, #product_of_three" do
  context "the simple case" do
    it "can handle three ints" do
      expect(ArrayOfInts.product_of_three([1,2,3])).to eq(6)
    end

    it "can handle four ints" do
      expect(ArrayOfInts.product_of_three([2,5,10,20])).to eq(1000)
    end

    it "can handle negatives" do
      expect(ArrayOfInts.product_of_three([-10,-10,1,3,2])).to eq(300)
    end
  end
end
