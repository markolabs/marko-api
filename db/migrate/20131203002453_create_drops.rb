class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.references :sender
      t.references :receiver
      t.references :message

      t.timestamps
    end
    add_index :drops, :sender_id
    add_index :drops, :receiver_id
    add_index :drops, :message_id
  end
end
