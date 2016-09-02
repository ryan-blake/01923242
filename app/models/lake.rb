# == Schema Information
#
# Table name: lakes
#
#  id         :integer          not null, primary key
#  name       :string
#  zipcode    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lake < ActiveRecord::Base
end
