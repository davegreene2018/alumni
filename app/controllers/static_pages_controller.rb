class StaticPagesController < ApplicationController
  def index
  end

  def home
  	 @forums = Forum.all.order('created_at desc')
  	 @profiles = Profile.all.order('created_at desc')
  end

  def members
  	 @users = User.all
  end

  

 
end
