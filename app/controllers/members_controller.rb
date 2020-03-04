class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  

	MEMBERS_PER_PAGE = 5
  STATUS_PER_PAGE = 5

  def index
    @totalusers = User.count
    @limitPages = @totalusers / MEMBERS_PER_PAGE
    @page = params.fetch(:page,0).to_i
    @users = User.offset(@page * MEMBERS_PER_PAGE).limit(MEMBERS_PER_PAGE)
   
  end

 def show
   @user = User.find(params[:id])
   @recentforum = Forum.all.where('user_id = ?', @user.id).order('created_at DESC')

   @totalstatus = Profile.where('user_id = ?', current_user.id).count
    @limitPages = @totalstatus / STATUS_PER_PAGE
    @page = params.fetch(:page,0).to_i

    @profiles = Profile.all
    @profiles = Profile.all.where('user_id = ?', @user.id).order('created_at DESC')
    @profile = Profile.new

    @profiles = Profile.offset(@page * STATUS_PER_PAGE).limit(STATUS_PER_PAGE)

    
   
 end 

  private
    # Use callbacks to share common setup or constraints between actions.
   

    def set_member
      @member= User.find(params[:id])
    end



    

 
 
end
