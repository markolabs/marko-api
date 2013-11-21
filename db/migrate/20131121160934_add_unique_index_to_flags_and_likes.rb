class AddUniqueIndexToFlagsAndLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :message_id], unique: true
    add_index :flags, [:user_id, :message_id], unique: true
  end
end
