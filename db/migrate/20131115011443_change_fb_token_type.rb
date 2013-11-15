class ChangeFbTokenType < ActiveRecord::Migration
  def change
    change_column :users, :fb_user_id, :bigint
  end
end
