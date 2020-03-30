module FriendshipsHelper

	def is_friend(friendship)
    friendship.friend_id == current_user.id 
  end

end
