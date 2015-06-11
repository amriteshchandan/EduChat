class ProfileController < ApplicationController
	before_action :authenticate_user!
  	
  	def show
<<<<<<< HEAD
  		@technologies = current_user.technologies
  		@user = current_user
=======
  		@user = current_user#User.find(params[:id])
>>>>>>> 96cb0bc71e917e5d378ad801e708723e1fbd3e30
  		@articles = @user.articles.paginate(page: params[:page])
  	end
end
