# == Schema Information
#
# Table name: parks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Park < ActiveRecord::Base
end
