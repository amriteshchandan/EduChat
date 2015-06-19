module TechnologiesHelper

	def related_article_render
		arr = []
		@article_feeds = @technology.technology_article_feed
		@article_feeds.each do |article|
			arr << article[:title]
		end
		return arr
	end
end
