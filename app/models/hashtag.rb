class Hashtag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  def post_form_attribute
    "existing-hashtag-" + "#{id}"
  end
end
