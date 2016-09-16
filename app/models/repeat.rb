# == Schema Information
#
# Table name: repeats
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  title      :string
#  tag        :string
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Repeat < ActiveRecord::Base
  include EventMixin
  belongs_to :event

   scope :root_event, -> (id) { where(:event_id => id) }
end
