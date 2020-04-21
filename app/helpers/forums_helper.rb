module ForumsHelper

	def forum_is_owner(forum)
    user_signed_in? && current_user.id == forum.user_id
  end

  def reply_is_owner(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end
