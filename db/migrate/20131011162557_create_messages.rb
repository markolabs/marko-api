class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.float :latitude
      t.float :longitude
      t.string :type
      t.attachment :image
      t.string :caption
      t.references :user

      t.timestamps
    end
    add_index :messages, :user_id
  end
end
