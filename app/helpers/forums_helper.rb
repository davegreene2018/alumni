module ForumsHelper

	def forum_author(forum)
    user_signed_in? && current_user.id == forum.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end
