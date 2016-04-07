require 'rspec'
require_relative 'meeting'

RSpec.describe Meeting, "#condense_meeting_time" do

  context "condense_meeting_time" do
    it "works if no meeting times over" do
      expect(Meeting.condense_meeting_time([[0,1],[3,6]])).to eq([[0,1],[3,6]])
    end

    it "works if times overlap" do
      expect(Meeting.condense_meeting_time([[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]])).to eq( [[0, 1], [3, 8], [9, 12] ])
    end

    it "works if they just touch" do
      expect(Meeting.condense_meeting_time([ [1, 2], [2, 3] ])).to eq([[1,3]])
    end

    it "works if the second meeting starts later and ends before the other meeting" do
      expect(Meeting.condense_meeting_time([ [1, 5], [2, 3] ])).to eq([[1,5]])
    end

    it "works if one meeting is all inclusive" do
      expect(Meeting.condense_meeting_time([[1, 10], [2, 6], [3, 5], [7, 9] ])).to eq([1,10])
    end
  end
end
