class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :sender
      t.references :receiver
      t.integer :target_id
      t.string :target_type
      t.boolean :read

      t.timestamps
    end
    add_index :notifications, :target_id
    add_index :notifications, :target_type
    add_index :notifications, :sender_id
    add_index :notifications, :receiver_id
  end
end
