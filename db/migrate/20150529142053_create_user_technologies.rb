class CreateUserTechnologies < ActiveRecord::Migration
  def change
    create_table :user_technologies do |t|
      t.integer :user_id
      t.integer :technology_id
      t.string :technology_type
      t.integer :expertise

      t.timestamps null: false
    end
  end
end
