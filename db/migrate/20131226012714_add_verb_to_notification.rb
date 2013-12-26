class AddVerbToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :verb, :string
  end
end
