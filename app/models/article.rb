class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :technology
	has_many :comments
	validates :user_id, presence: true
	validates :content, presence: true
	validates :title, presence: true

	default_scope -> { order(created_at: :desc) }
end
