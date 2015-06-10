class RemoveRateFromTechnologies < ActiveRecord::Migration
  def change
    remove_column :technologies, :rate, :integer
  end
end
