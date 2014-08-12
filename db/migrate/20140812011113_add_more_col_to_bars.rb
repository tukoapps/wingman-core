class AddMoreColToBars < ActiveRecord::Migration
  def change

    add_column :bars, :address, :string
    add_column :bars, :city, :string
    add_column :bars, :state, :string

    add_index :events, :mobile_user_id
    add_index :events, :bar_id

  end
end
