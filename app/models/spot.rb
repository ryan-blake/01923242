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
  belongs_to :user

  has_attached_file :spot_image, styles: {
    thumb: '100x100',
    square: '200x200',
    medium: '300x300',
    tween: '450x450',
    large: '600x600'
  }
  validates_attachment_content_type :spot_image,  :content_type => /\Aimage\/.*\Z/


end
