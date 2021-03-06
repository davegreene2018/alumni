class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.all
    @conversations = Conversation.all

    @mymessages = Message.all.where('user_id = ?', current_user.id)
    @messagenotification = @mymessages.all.where('read = ?', false).count

     if @mymessages.length > 1
      @display = "You have no messages to show"
    else 
      @display = ""
    end 
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_conversation
      @conversation = Conversation.find(params[:id])
    end
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

end