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
			redirect_to user_article_path(@article.title)
		else
			render :new	
		end
	end


	def show
		#@article = Article.find(params[:id])
		@article = Article.find_by(:title => params[:title])
		@article = Article.find_by(:id => params[:title].to_i) if @article.blank?
		#authorize! :update, @article
	end


	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success] = "Article Updated"
			redirect_to user_article_path(@article.title)
		else
			@feed_items = []
			redirect_to root_url	
		end
	end

	def edit
		#@article = Article.find(params[:id])
		@article = Article.find_by(:title => params[:heading])
		@tech_collection = UserTechnology.where("user_id = ? AND technology_type = ?", current_user.id, "known")
		authorize! :update, @article
	end



	def destroy
		#@article = Article.find_by(:title => params[:title])
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
