class AddFacebookColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :access_token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :male, :boolean
    add_column :users, :fb_id, :int, :limit => 8
    add_index :users, :fb_id
    add_index :users, :access_token
  end
  
end
