class HomeController < ApplicationController
  def index
  	@articles = Article.all
  	#@article = current_user.articles.build if user_signed_in?

  	#if current_user.present?
  	#	@feed_items = current_user.feed.paginate(page: params[:page])
  	#else
  		
  	#end	

  	if user_signed_in?
      @article = current_user.articles.build
      @feed_items = current_user.feed.paginate(page: params[:page])
  		
      if current_user.sign_in_count <= 1
  			redirect_to edit_user_registration_path
  		end
    else
      render 'home/index'
  	end
  
  end
end