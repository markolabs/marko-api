class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user
      t.references :friend

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :friend_id
  end
end
