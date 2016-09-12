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
  extend SimpleCalendar
  validate :future_reservations_only, :on => :create
  validates_datetime :end_time, :after => :start_time
  validates :start_time, :end_time, overlap: { scope: 'spot_id',
                                             message_content: 'overlaps with Users other meetings.' }

  validate :unbooked_events
  belongs_to :user
  belongs_to :spot

 # validates :name, presence: true
  def unbooked_events
    if Event.where(user_id: user, spot_id: spot, booked: false).length >= 1
      puts "something unpaid !!!!"
      errors.add(:booked, "Either Cancel or Pay prev. reservation.")
    end
  end


  def future_reservations_only
    if start_time < Time.now
     errors.add(:start_time, "cannot be in the past")
    end
  end


def self.one_reservation_at_a_time
  if Event.where(spot_id: @spot.id, booked: false, user_id: @user.id)
    errors.add("no no")
  end
end


end
