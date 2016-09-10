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
  validate :expiration_date_cannot_be_in_the_past, :discount_cannot_be_greater_than_total_value
  extend SimpleCalendar
 belongs_to :user
 belongs_to :spot
 # validates :name, presence: true

 def expiration_date_cannot_be_in_the_past
    if (start_time.present?) && (start_time < Date.today)
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def discount_cannot_be_greater_than_total_value
   if start_time > end_time
     errors.add(:start_time, "can't be greater than end time value")
   end
 end





#    def start_time_not_reserved
#     @spot.event.each do |i|
#       array = []
#       array << i.start_time
#     end
#     array.each do |i|
#       if start_time.present? && start_time == array[i]
#        errors.add(:start_time, "Time already reserved")
#       end
#     end
#    end

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
