class HomeController < ApplicationController
  def index
  	@articles = Article.all
  	@article = current_user.articles.build if user_signed_in?
  	@feed_items = current_user.feed.paginate(page: params[:page])

  	if user_signed_in?
  		if current_user.sign_in_count < 1
  			redirect_to edit_user_registration_path
  		end
  	end
  end
end