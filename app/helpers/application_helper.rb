module ApplicationHelper
  def current_user_image
    current_user.blank? || current_user.image.blank? ? default_profile_image_url : current_user.image_url
  end

  def default_profile_image_url
    "default_profile_image.jpeg"
  end

  def login_helper
    if current_user.blank?
      (link_to "Log in", new_user_session_path) +
      " or ".html_safe +
      (link_to "Sign up", new_user_registration_path, class: "btn btn-primary") +
      " or ".html_safe +
      (link_to "Sign up with Facebook", user_facebook_omniauth_authorize_path, method: :post, class: "btn btn-primary")
    else
      "Welcome back ".html_safe +
      (link_to current_user.name, current_user) +
      " | ".html_safe +
      (link_to "Log out", destroy_user_session_path, method: :delete)
    end
  end
end
