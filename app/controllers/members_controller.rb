class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  

	MEMBERS_PER_PAGE = 5
  STATUS_PER_PAGE = 5

  def index
    @totalusers = User.count
    @limitPages = @totalusers / MEMBERS_PER_PAGE
    @page = params.fetch(:page,0).to_i
    @users = User.offset(@page * MEMBERS_PER_PAGE).limit(MEMBERS_PER_PAGE)

    @user = User.all

  end

 def show
   @user = User.find(params[:id])
   @users = User.all
   @recentforum = Forum.all.where('user_id = ?', @user.id).order('created_at DESC')
   @profiles = Profile.all.where('user_id = ?', @user.id).order('created_at DESC')
   @profile = Profile.new

   @friendship = Friendship.all.where('friend_id = ?', @user.id)

   #pagination
   @totalstatus = Profile.count
   @limitPages = @totalstatus / STATUS_PER_PAGE
   @page = params.fetch(:page,0).to_i
   @profiles = Profile.all.where('user_id = ?', @user.id).order('created_at DESC').offset(@page * STATUS_PER_PAGE).limit(STATUS_PER_PAGE)
   
 end 

  private
    # Use callbacks to share common setup or constraints between actions.
   

    def set_member
      @member= User.find(params[:id])
    end



    

 
 
end
