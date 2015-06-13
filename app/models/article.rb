class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :technology
	validates :user_id, presence: true
	validates :content, presence: true
	validates :title, presence: true
end
