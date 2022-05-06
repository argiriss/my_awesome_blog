class Hashtag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  def post_form_attribute
    ENV["existing_hashtag_secure_uuid"] + "#{id}"
  end
end
