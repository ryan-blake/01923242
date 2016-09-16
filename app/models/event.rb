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
#  payed      :boolean          default(FALSE)
#  booked     :boolean          default(FALSE)
#  charge_id  :integer
#  tag        :string
#  repeat     :string
#

class Event < ActiveRecord::Base
  extend SimpleCalendar
  validate :future_reservations_only, :on => :create
  validates_datetime :end_time, :after => :start_time
  validates :start_time, :end_time, overlap: { scope: 'spot_id',
                                             message_content: 'overlaps with Users other meetings.' }
  validate :unbooked_events, :on => :create

  belongs_to :user
  belongs_to :spot
  has_many :repeats, dependent: :destroy
  accepts_nested_attributes_for :repeats

    after_save :replicate

    REPEAT = ["none", "daily", "weekly", "monthly", "yearly"]
    COLOR_TAG = ["primary", "red", "blue", "yellow", "green"]

    def replicate
       case self.repeat
       when "daily"
      # TODO: add :until field to the form
      all_dates = Recurrence.new(:starts => self.start_time,
                                 :every => :day,
                                 :until => self.end_time)
    when "weekly"
      all_dates = Recurrence.new(:starts => self.start_time,
                                 :every => :week,
                                 :until => self.end_time,
                                 :on => Date.today.wday)
    when "monthly"
      all_dates = Recurrence.new(:starts => self.start_time,
                                 :every => :month,
                                 :on => Date.today.mday,
                                 :until => self.end_time)
    when "yearly"
      all_dates = Recurrence.new(:starts => self.start_time,
                                 :every => :year,
                                 :on => Date.today.yday,
                                 :until => self.end_time)
    else
      all_dates = [Date.today]
    end

    all_dates.each do |date|
      event = Repeat.new(start_time: self.start_time,
                         end_time: self.end_time,
                         event_id: self.id,
                         title: self.name,
                         tag: self.tag)
      event.save
    end
  end

 # validates :name, presence: true
  def unbooked_events
    if Event.where(user_id: user, spot_id: spot, booked: false).length >= 1

      errors.add(:booked, "Either Cancel or Pay previous reservation.")

    end
  end


  def future_reservations_only
    if start_time < Time.now
     errors.add(:start_time, "cannot be in the past")
    end
  end

  def difference(event)
    puts start_time.strftime("%d")
  end

  def view_class
    case self.tag
    when "red"
      "bg-danger"
    when "blue"
      "bg-info"
    when "yellow"
      "bg-warning"
    when "green"
      "bg-success"
    when "primary"
      "bg-primary"
    end
  end

end
