# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  item        :string
#  user_id     :integer
#  vendor_id   :integer
#  token       :string
#  customer_id :string
#  completed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  price       :integer
#

class Charge < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor, class_name: 'User', foreign_key: 'vendor_id'
end
