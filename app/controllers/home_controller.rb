class HomeController < ApplicationController
  def index
  	@article = current_user.articles.build if user_signed_in?
  	if user_signed_in?
  		if current_user.sign_in_count < 1
  			redirect_to edit_user_registration_path
  		end
  	end
  end
end