class FriendshipsController < ApplicationController
	def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to request.referrer
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to profiles_path
    end
  end
  
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to request.referrer
  end
end
