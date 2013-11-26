class AddDeletedAtToModels < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :time
    add_column :messages, :deleted_at, :time
  end
end
