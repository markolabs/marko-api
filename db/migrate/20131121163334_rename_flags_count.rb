class RenameFlagsCount < ActiveRecord::Migration
  def change
    rename_column :messages, :flags_counter, :flags_count
  end
end
