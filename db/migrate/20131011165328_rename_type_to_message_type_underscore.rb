class RenameTypeToMessageTypeUnderscore < ActiveRecord::Migration
  def change
    rename_column :messages, :messagetype, :message_type
  end
end
