class SessionAndDeviceParanoid < ActiveRecord::Migration
  def change
    add_column :sessions, :deleted_at, :time
    add_column :devices, :deleted_at, :time
  end
end
