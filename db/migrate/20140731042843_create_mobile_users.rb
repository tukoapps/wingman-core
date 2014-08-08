class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|

      t.string :first_name
      t.string :last_name
      t.string :fb_access_token
      t.integer :fb_id, :limit => 8
      t.string :email
      t.boolean :male
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lon, precision: 10, scale: 6
      
      t.timestamps
    end

    remove_index :users, :fb_id
    remove_index :users, :access_token
    remove_column :users, :access_token
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :male
    remove_column :users, :fb_id
    

    add_index :mobile_users, :fb_id
    add_index :mobile_users, :fb_access_token
  end
end
