module ApplicationHelper
  def current_user_image
    current_user.blank? || current_user.image.nil? ? 'default_profile_image.jpeg' : current_user.image_url
  end
end
