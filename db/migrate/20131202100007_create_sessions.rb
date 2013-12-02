class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token
      t.references :user
      t.references :device

      t.timestamps
    end
    add_index :sessions, :token, unique: true
    add_index :sessions, :user_id
    add_index :sessions, :device_id
  end
end
