class AddFlagCounterToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :flags_counter, :integer
  end
end
