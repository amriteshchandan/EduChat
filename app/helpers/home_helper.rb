module HomeHelper
	def feed_render
		arr = []
		@feed_items = current_user.feed.paginate(page: params[:page])
		@feed_items.each do |f|
			arr << f[:title]
		end
		return arr
	end


	def user_render
		arr = []
		@may_know_user = current_user.user_may_know_other_user#.paginate(page: params[:page])
		if @may_know_user != nil
			@may_know_user.each do |u|
				arr << u[:name]
			end
		end
			
	end
end
