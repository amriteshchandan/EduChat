class ProfileController < ApplicationController
	before_action :authenticate_user!
  	
  	def show
  		@technologies = current_user.technologies
  	end
end
