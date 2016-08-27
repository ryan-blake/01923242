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
#  park_id     :integer
#  term_id     :integer
#  covered     :boolean
#  ramp        :integer
#  user_id     :integer
#  arrived     :boolean
#

class Spot < ActiveRecord::Base
  belongs_to :park
  belongs_to :term
  has_many :users
end
