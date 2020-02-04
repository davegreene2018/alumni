class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy, :like, :dislikes]
  before_action :set_forum, only: [:create, :edit, :show, :update, :destroy]

  def create
    @reply = @forum.replies.create(params[:reply].permit(:reply, :forum_id, :likes, :dislikes))
    @reply.user_id = current_user.id
    @reply.likes = 0
    @reply.dislikes = 0

    respond_to do |format|
      if @reply.save
        format.html { redirect_to forum_path(@forum) }
        format.js  # renders create.js.erb
      else
        format.html { redirect_to forum_path(@forum), notice: "Reply did not save. Please try again."}
        format.js
      end
    end
  end

  def new
  end


  def destroy
    @reply = @forum.replies.find(params[:id])
    @reply.destroy
    redirect_to forum_path(@forum)
  end

  def edit
    @forum = Forum.find(params[:forum_id])
    @reply = @forum.replies.find(params[:id])
  end

  def update
    @reply = @forum.replies.find(params[:id])
     respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to forum_path(@forum), notice: 'Reply was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

   def dislike

    @reply = Reply.find_by(id: params[:id])
    @reply.update_attribute(:dislikes, @reply.dislikes+1)
    redirect_to forum_path(@reply.forum_id)
     
  end
  
  def like
    
    @reply = Reply.find_by(id: params[:id])
    @reply.update_attribute(:likes, @reply.likes+1)
     redirect_to forum_path(@reply.forum_id) 
    
         
  end

  private

  def set_forum
    @forum = Forum.find(params[:forum_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply, :likes, :dislikes)
  end
end
