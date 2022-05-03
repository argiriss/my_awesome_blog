class Post < ApplicationRecord
  belongs_to :user
  has_many :hashtags, dependent: :destroy
  accepts_nested_attributes_for :hashtags, 
                                allow_destroy: true
end
