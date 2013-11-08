class CreateColorThemes < ActiveRecord::Migration
  def change
    create_table :color_themes do |t|
      t.string :name
      t.string :background
      t.string :text

      t.timestamps
    end
  end
end
