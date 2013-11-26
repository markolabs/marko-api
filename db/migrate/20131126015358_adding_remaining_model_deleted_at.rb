class AddingRemainingModelDeletedAt < ActiveRecord::Migration
  def change
    add_column :flags, :deleted_at, :time
    add_column :impressions, :deleted_at, :time
    add_column :likes, :deleted_at, :time
    add_column :pings, :deleted_at, :time
    add_column :relationships, :deleted_at, :time
  end
end
