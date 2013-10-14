class RenameTypeToMessageType < ActiveRecord::Migration
  def change
    rename_column :messages, :type, :messagetype
  end
end
