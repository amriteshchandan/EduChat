module ArticlesHelper
	def tech_collection
		@tech_collection = UserTechnology.where("user_id = ? AND technology_type = ?", current_user.id, "known")
	end
end
