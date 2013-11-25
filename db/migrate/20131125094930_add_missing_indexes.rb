class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :likes, [:like_id, :like_id]
    add_index :flags, [:flag_id, :user_id]
  end
end
