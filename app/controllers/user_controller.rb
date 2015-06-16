class UserController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find_by(:username => params[:username] )	 #where(name:  (params[:name])).first
					#find_by(:name)	
		@articles = @user.articles.paginate(page: params[:page], per_page: 4)
		@interested_tech = @user.user_technologies.where("technology_type = ?", 'interested')
  		@known_tech = @user.user_technologies.where("technology_type = ?", 'known')
	end

end
