class AddMoreToBars < ActiveRecord::Migration
  def change

    add_column :bars, :neighborhood, :string
    add_column :bars, :category, :string

    add_index :bars, :yelp_id 

  end
end
