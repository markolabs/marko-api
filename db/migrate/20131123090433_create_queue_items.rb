class CreateQueueItems < ActiveRecord::Migration
  def change
    create_table :queue_items do |t|
      t.references :message
      t.references :sender
      t.references :recipient

      t.timestamps
    end
    add_index :queue_items, :message_id
    add_index :queue_items, :sender_id
    add_index :queue_items, :recipient_id
  end
end
