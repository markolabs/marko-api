class MakeNotificationsParanoid < ActiveRecord::Migration
  def change
    add_column :notifications, :deleted_at, :time
  end
end
