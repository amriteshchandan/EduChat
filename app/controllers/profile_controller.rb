class ProfileController < ApplicationController
	before_action :authenticate_user!
  	
  	def show
  		@technologies = current_user.technologies
  		@user = current_user
  		@user = current_user#User.find(params[:id])
  		@articles = @user.articles.paginate(page: params[:page])
  	end
end
