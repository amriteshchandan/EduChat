class ProfileController < ApplicationController
	before_action :authenticate_user!
  	
  	def show
  		@technologies = current_user.technologies
  		@interested_tech = current_user.user_technologies.where("technology_type = ?", 'interested')
  		@known_tech = current_user.user_technologies.where("technology_type = ?", 'known')

  		@user = current_user#User.find(params[:id])
  		@articles = @user.articles.paginate(page: params[:page])
  	end
end
