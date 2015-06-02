class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
      t.integer :rate

      t.timestamps null: false
    end
  end
end
