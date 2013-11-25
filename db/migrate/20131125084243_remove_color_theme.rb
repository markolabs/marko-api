class RemoveColorTheme < ActiveRecord::Migration
  def up
    remove_column :messages, :color_theme_id
    drop_table :color_themes
  end
end
