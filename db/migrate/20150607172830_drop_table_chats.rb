class DropTableChats < ActiveRecord::Migration
  def up
    drop_table :chats
  end
end
