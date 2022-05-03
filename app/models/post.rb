class Post < ApplicationRecord
  belongs_to :user
  has_many :hashtags, dependent: :destroy
end
