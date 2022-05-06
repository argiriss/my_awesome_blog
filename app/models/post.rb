class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :body, :image
end
