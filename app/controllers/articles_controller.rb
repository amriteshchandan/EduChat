class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: :destroy



	def new
		@article = current_user.articles.build
		
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "Article created"
			redirect_to @article
		else
			render :new	
		end
	end


	def show
		@article = Article.find(params[:id])
	end


	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success] = "Article Updated"
			redirect_to @article
		else
			@feed_items = []
			redirect_to root_url	
		end
	end

	def edit
		@article = Article.find(params[:id])
		@tech_collection = UserTechnology.where("user_id = ? AND technology_type = ?", current_user.id, "known")
	end



	def destroy
		@article.destroy
		flash[:success] = "Article deleted"
		redirect_to request.referrer || root_url
	end


	private
		def article_params
			params.require(:article).permit(:title, :content, :user_id, :technology_id)
		end

		def correct_user
			@article = current_user.articles.find_by(id: params[:id])
			redirect_to root_url if @article.nil?
		end
end
