class MakeDropParanoid < ActiveRecord::Migration
  def change
    add_column :drops, :deleted_at, :time
  end
end
