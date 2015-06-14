module HomeHelper
	def feed_render
		arr = []
		@feed_items = current_user.feed.paginate(page: params[:page])
		@feed_items.each do |f|
			arr << f[:title]
		end
		return arr
	end
end
