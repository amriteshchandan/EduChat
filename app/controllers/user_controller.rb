class UserController < ApplicationController
		before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles.paginate(page: params[:page])
		@interested_tech = @user.user_technologies.where("technology_type = ?", 'interested')
  		@known_tech = @user.user_technologies.where("technology_type = ?", 'known')
	end

end
