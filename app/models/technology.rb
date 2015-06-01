class Technology < ActiveRecord::Base
	has_many :user_technologies
	has_many :users, through: :user_technologies

	acts_as_tree
end
