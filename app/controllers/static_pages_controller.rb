class StaticPagesController < ApplicationController
	MEMBERS_PER_PAGE = 5
  POSTS_PER_PAGE = 5

  def index
     
     
  end

  def home
  	 @forums = Forum.all.order('created_at desc').limit(4)
  	 @profiles = Profile.all.order('created_at desc').limit(5)
     subjectId = "1"
     @events = Forum.where(subject_id: '12').limit(1)
     @collegeLife = Forum.where(subject_id: '11').limit(1)
     @users = User.all
  end

  def browseforums
     @subjects = Subject.all
     @totalforums = Forum.count
  end

  def members
  	@totalusers = User.count
  	@limitPages = @totalusers / MEMBERS_PER_PAGE
  	@page = params.fetch(:page,0).to_i
  	@users = User.offset(@page * MEMBERS_PER_PAGE).limit(MEMBERS_PER_PAGE)
    
  end

  
def myposts
    @totalmyposts = Forum.all.where('user_id = ?', current_user.id).count
    @limitPages = @totalmyposts / POSTS_PER_PAGE
    @page = params.fetch(:page,0).to_i
     @forums = Forum.all.where('user_id = ?', current_user.id).order('created_at DESC').offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
     
  end
 
end
