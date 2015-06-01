class ChatController < ApplicationController
	before_action :authenticate_user!
  	def conversation
  		p params
  	end
end
