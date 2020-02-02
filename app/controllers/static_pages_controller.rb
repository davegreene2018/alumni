class StaticPagesController < ApplicationController
  def index
  end

  def home
  end

  def members
  	 @users = User.all
  end

  def profile
  	@users = User.all
  end 
end
