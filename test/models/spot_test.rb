# == Schema Information
#
# Table name: spots
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  length      :integer
#  width       :integer
#  depth       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  price       :integer
#  user_id     :integer
#  term_id     :integer
#  park_id     :integer
#

require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
