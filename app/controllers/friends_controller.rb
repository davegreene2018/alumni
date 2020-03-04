class FriendsController < ApplicationController
	def index
    @users = User.all
  end
  
  def show
   @user = current_user
  end
  def create
    
  end
  
  def destroy
   
  end
end
