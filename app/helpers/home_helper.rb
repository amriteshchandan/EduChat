module HomeHelper
	def feed_render
		arr = []
		@feed_items = current_user.feed#.paginate(page: params[:page], per_page: 5)
		@feed_items.each do |f|
			arr << f[:title]
		end
		return arr
	end


	def user_render
		arr1 = []
		@may_know_user = current_user.user_may_know_other_user#.paginate(page: params[:page], per_page: 5)
		if @may_know_user != nil
			@may_know_user.each do |u|
				arr1 << u[:username]
			end
		end
		arr1.delete_if { |a| a == current_user.username }
		return arr1
	end
end
