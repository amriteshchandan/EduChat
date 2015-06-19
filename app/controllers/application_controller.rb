class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :mailbox, :conversation

  #rescue_from CanCan::AccessDenied do |exception|
   # redirect_to root_url, :alert => exception.message
  #end

  private

  	def mailbox
  		@mailbox ||= current_user.mailbox
  	end

  	def conversation
      @conversation ||= mailbox.conversations.find(params[:id])
  	end
end
