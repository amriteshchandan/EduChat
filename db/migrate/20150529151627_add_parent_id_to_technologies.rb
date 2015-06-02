class AddParentIdToTechnologies < ActiveRecord::Migration
  def change
    add_column :technologies, :parent_id, :integer
  end
end
