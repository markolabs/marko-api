class AddLikeCountToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :likes_count, :integer
  end
end
