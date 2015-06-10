class RemoveExpertiseFromUserTechnologies < ActiveRecord::Migration
  def change
    remove_column :user_technologies, :expertise, :integer
  end
end
