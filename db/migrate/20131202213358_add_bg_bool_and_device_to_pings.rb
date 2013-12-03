class AddBgBoolAndDeviceToPings < ActiveRecord::Migration
  def change
    add_column :pings, :background, :boolean
    add_column :pings, :device_id, :integer

    add_index :pings, :background
    add_index :pings, :device_id
  end
end
