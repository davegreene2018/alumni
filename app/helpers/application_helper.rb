module ApplicationHelper
	
  def is_friends(friendship)
    user_signed_in? && current_user.id == friendship.friend_id
  end

  def status_author(profile)
    user_signed_in? && current_user.id == profile.user_id
  end

 def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "border-radius-50")
  end
   
end
