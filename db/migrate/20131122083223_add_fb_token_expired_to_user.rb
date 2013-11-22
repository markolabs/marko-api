class AddFbTokenExpiredToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_token_expired, :boolean
  end
end
