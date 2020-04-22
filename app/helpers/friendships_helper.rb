module FriendshipsHelper

  def is_friend(friendship)
   user_signed_in? && current_user.id == friendship.friend.user_id
  end



end
