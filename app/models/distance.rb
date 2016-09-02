# == Schema Information
#
# Table name: distances
#
#  id         :integer          not null, primary key
#  value      :integer
#  spot_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Distance < ActiveRecord::Base
  belongs_to :spot
end
