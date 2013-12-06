class AddFbDetailsToUser < ActiveRecord::Migration
  def change
    add_attachment :users, :avatar
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
