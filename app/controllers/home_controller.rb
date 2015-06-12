class HomeController < ApplicationController
  @@a = 1 ;
  def index
  	@articles = Article.all

  	if user_signed_in?
      @article = current_user.articles.build
      @feed_items = current_user.feed.paginate(page: params[:page])
  		
      if @@a > 1
          render 'home/index'
      elsif current_user.sign_in_count <= 1
        @@a = @@a + 1
  			redirect_to edit_user_registration_path

  		end
    else
      render 'home/index'
  	end
  
  end
end