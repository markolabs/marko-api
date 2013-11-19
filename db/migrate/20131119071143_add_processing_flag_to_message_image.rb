class AddProcessingFlagToMessageImage < ActiveRecord::Migration
  def change
    add_column :messages, :image_processing, :boolean
  end
end
