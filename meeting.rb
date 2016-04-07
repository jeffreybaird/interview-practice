require 'pry'
module Meeting

  def self.condense_meeting_time(meeting_times)
    condensed = []
    size_of_condensed = 0
    meeting_times.each do |meeting|
      size_of_condensed = condensed.size
      meeting_times.each do |meet|
        temp = [meeting,meet].sort_by{|x| x.max}
        condensed << condense(temp[0],temp[1]) if meetings_overlap?(temp[0],temp[1])
      end
      condensed << meeting if size_of_condensed == condensed.size
    end
    condensed.uniq
  end

  def self.any_remaining_overlap?(meetings, meeting_to_check=nil)
    meeting_to_check = meetings.shift(1) unless meeting_to_check
    if meetings.size == 1
      m1,m2 = [meetings[0],meeting_to_check].sort_by{|x| x.max}
      meetings_overlap?(m1,m2)
  end

  def self.meetings_overlap?(meeting1, meeting2)
    return false if meeting1 == meeting2
    meeting1.max >= meeting2.min
  end

  def self.condense(meeting1,meeting2)
    times = meeting1 + meeting2
    [times.min,times.max]
  end

end
