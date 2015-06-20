class RemoveConfirmableModuleFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :confirmation_token, :string
  	remove_column :users, :confirmed_at, :datetime
  	remove_column :users, :confirmation_sent_at, :datetime
  	remove_column :users, :unconfirmed_email, :string
  	remove_column :users, :dob, :date
  	remove_column :users, :gender, :string
  	remove_column :users, :college, :string
  end
end
