class ArticlesController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "Article created"
			redirect_to root_url
		else
			redirect_to root_url	
		end
	end

	def destroy
		
	end

	private
		def article_params
			params.require(:article).permit(:title, :content, :user_id)
		end
end
