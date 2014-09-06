class CleanUpBars < ActiveRecord::Migration
  def change
    remove_column :bars, :current_users
    remove_column :bars, :city
    remove_column :bars, :state
    remove_column :bars, :neighborhood
  end
end
