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

require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
