class AddMoreFieldsToBars < ActiveRecord::Migration
  def change
    add_column :bars, :description, :text
    add_column :bars, :music, :string
    add_column :bars, :food, :string
    add_column :bars, :drink_price, :float
    add_column :bars, :schedule, :text
  end
end
