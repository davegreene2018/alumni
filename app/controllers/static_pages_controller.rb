class StaticPagesController < ApplicationController
	MEMBERS_PER_PAGE = 5

  def index
     
     
  end

  def home
  	 @forums = Forum.all.order('created_at desc').limit(4)
  	 @profiles = Profile.all.order('created_at desc').limit(5)
     subjectId = "1"
     @events = Forum.where(subject_id: '3').limit(1)
     @collegeLife = Forum.where(subject_id: '1').limit(1)
  end

  def members
  	@totalusers = User.count
  	@limitPages = @totalusers / MEMBERS_PER_PAGE
  	@page = params.fetch(:page,0).to_i
  	@users = User.offset(@page * MEMBERS_PER_PAGE).limit(MEMBERS_PER_PAGE)
    
  end

  

 
end
