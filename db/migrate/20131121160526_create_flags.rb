class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user
      t.references :message

      t.timestamps
    end
    add_index :flags, :user_id
    add_index :flags, :message_id
  end
end
