# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start_time :datetime
#  end_time   :datetime
#  user_id    :integer
#  spot_id    :integer
#

class Event < ActiveRecord::Base
  # validate :end_time_not_reserved
  # validate :start_time_not_reserved


 belongs_to :user
 belongs_to :spot
 extend SimpleCalendar


 #   def start_time_not_reserved
 #    @spot.event.each do |i|
 #      array = []
 #      array << i.start_time
 #    end
 #    array.each do |i|
 #      if start_time.present? && start_time == array[i]
 #       errors.add(:start_time, "Time already reserved")
 #      end
 #    end
      # end

 #   def end_time_not_reserved
 #     @spot.event.each do |i|
 #        array = []
 #        array << i.start_time
 #     end
 #     array.each do |i|
 #       if end_time.present? && end_time == array[i]
 #           errors.add(:start_time, "Time already reserved")
 #       end
 #     end
 # end


end
