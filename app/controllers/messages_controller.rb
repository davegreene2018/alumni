class MessagesController < ApplicationController
  before_action :find_conversation
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def index
    @messages = @conversation.messages

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messag
    end

    @message = @conversation.messages.new

    @messagesread = Message.select('read').where('user_id = ?', current_user.id)
    @messagesread = true

    @mymessages = Message.all.where('user_id = ?', current_user.id)
    @messagenotification = @mymessages.all.where('read = ?', false).count





    

  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def new
    @message = @conversation.messages.new
  end

def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

   
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end



    
end