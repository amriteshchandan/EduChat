class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.belongs_to :technology

      t.timestamps null: false
    end
    add_index :articles, :user_id
    add_index :articles, :technology_id
  end
end
