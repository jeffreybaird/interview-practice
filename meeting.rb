require 'pry'
module Meeting

  def self.condense_meeting_time(meeting_times)
    local_condensed = condensed(meeting_times)
    if any_remaining_overlap?(local_condensed).all?
      condense_meeting_time(local_condensed)
    else
      local_condensed
    end
  end

  def self.condensed(meeting_times)
    times = []
    size_of_condensed = 0
    meeting_times.each do |meeting|
      size_of_condensed = times.size
      meeting_times.each do |meet|
        temp = [meeting,meet].sort_by{|x| x.max}
        times << condense(temp[0],temp[1]) if meetings_overlap?(temp[0],temp[1])
      end
      times << meeting if size_of_condensed == times.size
    end
    times.uniq
  end

  def self.any_remaining_overlap?(meetings)
    return [false] if meetings.empty?
    meetings = meetings.sort_by.sort_by{|x| x.max}
    meeting_to_check = meetings.shift unless meeting_to_check
    if meetings.size == 1
      [meetings_overlap?(meeting_to_check, meetings[0])]
    else
      meetings.map{|m| meetings_overlap?(meeting_to_check,m) } + any_remaining_overlap?(meetings)
    end
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
