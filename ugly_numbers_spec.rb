require 'rspec'
require_relative 'ugly_numbers'

RSpec.describe("Ugly") do
  context "simple case" do
    it "can find zero non-ugly numbers" do
      expect(Ugly.numbers(123)).to eq(0)
    end

    it "can find 1 pretty number" do
      expect(Ugly.numbers(125)).to eq(1)
    end
  end
  
  context "combine numbers" do
    group = [NumberWrap.new(1),:+, NumberWrap.new(2), :-, NumberWrap.new(34)]
    it "combines an array properly" do
      expect(Ugly.combine(group).number).to eq(-31)
    end
  end

  context "resolve_combinations" do
    group = [NumberWrap.new(1),:+, NumberWrap.new(2), :-, NumberWrap.new(3), :|, NumberWrap.new(4)]
    it "resolves the number combinations" do
      expect(Ugly.resolve_combinations(group).map { |n| n.is_a?(NumberWrap) ? n.number : n  }).to eq([1,:+,2,:-, 34])
    end
  end
end
