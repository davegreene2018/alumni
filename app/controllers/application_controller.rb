class ApplicationController < ActionController::Base

def index
	@mymessages = Message.all.where('user_id = ?', current_user.id)
    @messagenotification = @mymessages.all.where('read = ?', false).count
end 

	
end
