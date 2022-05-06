class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :hashtags, through: :taggings
  
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :body, :image
end
