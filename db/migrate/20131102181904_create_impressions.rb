class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.references :user
      t.references :message

      t.timestamps
    end
    add_index :impressions, :user_id
    add_index :impressions, :message_id
  end
end
