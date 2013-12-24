class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :text
      t.integer :actor_id
      t.string :actor_type
      t.integer :object_id
      t.string :object_type
      t.integer :target_id
      t.string :target_type
      t.timestamps
    end
    add_index :notifications, :actor_id
    add_index :notifications, [:actor_type, :actor_id]
    add_index :notifications, :object_id
    add_index :notifications, [:object_type, :object_id]
    add_index :notifications, :target_id
    add_index :notifications, [:target_type, :target_id]
  end
end
