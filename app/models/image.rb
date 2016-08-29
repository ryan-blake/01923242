# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  spot_id    :integer
#  picture    :string
#  verified   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  belongs_to :spot
  has_attached_file :picture,
 :storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_c
onfig.yml",
 :styles => { :medium => "300x300" , :thumb => "100x100>"},
:dropbox_options => {
:path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       :unique_filename => true
  }


validates :picture, :attachment_presence => true
validates :spot, :presence =>true
end
