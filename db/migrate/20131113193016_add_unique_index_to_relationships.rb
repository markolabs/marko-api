class AddUniqueIndexToRelationships < ActiveRecord::Migration
  def change
    add_index :relationships, [:user_id, :friend_id], unique: true
  end
end
