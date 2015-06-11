class ProfileController < ApplicationController
	before_action :authenticate_user!
  	
  	def show
  		@user = current_user#User.find(params[:id])
  		@articles = @user.articles.paginate(page: params[:page])
  	end
end
