class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: :destroy

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "Article created"
			redirect_to root_url
		else
			@feed_items = []
			redirect_to root_url	
		end
	end

	def destroy
		@article.destroy
		flash[:success] = "Article deleted"
		redirect_to request.referrer || root_url
	end

	private
		def article_params
			params.require(:article).permit(:title, :content, :user_id)
		end

		def correct_user
			@article = current_user.articles.find_by(id: params[:id])
			redirect_to root_url if @article.nil?
		end
end
