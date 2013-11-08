class AddReferenceToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :color_theme_id, :integer
    add_index :messages, :color_theme_id
  end
end
