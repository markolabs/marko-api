class AddActiveStateToRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :active, :boolean
    add_column :relationships, :fb_friend, :boolean
    
    add_index :relationships, :active
    add_index :relationships, :fb_friend
  end
end
