# == Schema Information
#
# Table name: spots
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  length                  :integer
#  width                   :integer
#  depth                   :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  price                   :integer
#  park_id                 :integer
#  term_id                 :integer
#  covered                 :boolean
#  ramp                    :integer
#  user_id                 :integer
#  arrived                 :boolean
#  stripe_user_id          :integer
#  spot_image_file_name    :string
#  spot_image_content_type :string
#  spot_image_file_size    :integer
#  spot_image_updated_at   :datetime
#  image_url               :string
#  address                 :string
#  city                    :string
#  state                   :string
#  zipcode                 :integer
#  latitude                :float
#  longitude               :float
#  is_boat                 :boolean
#  type_id                 :integer
#  occupants               :integer
#  propulsion_id           :integer
#  make                    :text
#  lake_id                 :integer
#

class Spot < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  has_many :events
  belongs_to :park
  belongs_to :term
  belongs_to :user
  belongs_to :lake
  belongs_to :propulsion
  belongs_to :type

# image
  has_attached_file :spot_image, styles: {
    thumb: '100x100',
    square: '200x200',
    medium: '300x300',
    tween: '450x450',
    large: '600x600'
  }
  validates_attachment_content_type :spot_image,  :content_type => /\Aimage\/.*\Z/
  # mapping
  geocoded_by :full_address
  after_validation :geocode


  def full_address
    [address, city, state, zipcode].join(', ')
  end

  def check(events, spot_id)
     events.detect { |event| event.spot_id == spot_id }
  end
  def difference
     distance_of_time_in_words event.start_time, event.end_time
  end





end
