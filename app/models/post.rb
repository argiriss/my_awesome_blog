class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :hashtags, through: :taggings
  accepts_nested_attributes_for :hashtags, 
                                allow_destroy: true
  
  mount_uploader :image, ImageUploader
end
