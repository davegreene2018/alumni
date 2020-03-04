class MembersController < ApplicationController
	MEMBERS_PER_PAGE = 5

  def index
    @totalusers = User.count
    @limitPages = @totalusers / MEMBERS_PER_PAGE
    @page = params.fetch(:page,0).to_i
    @users = User.offset(@page * MEMBERS_PER_PAGE).limit(MEMBERS_PER_PAGE)
   
  end

 def show
   @user = User.find(params[:id])
   @recentforum = Forum.all.where('user_id = ?', @user.id).order('created_at DESC')

    @profiles = Profile.all
    @profiles = Profile.all.where('user_id = ?', @user.id).order('created_at DESC')
    @profile = Profile.new
   
 end 

  
 
 
end
