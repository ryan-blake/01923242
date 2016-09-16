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

require 'test_helper'

class RepeatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
