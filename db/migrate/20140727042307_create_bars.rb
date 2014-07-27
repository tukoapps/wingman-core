class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|

      t.string :name
      t.string :yelp_id
      t.string :logo_url
      t.string :image_url
      t.integer :phone_number
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lon, precision: 10, scale: 6
      t.integer :review_count
      t.decimal :rating, precision: 4, scale: 2
      t.integer :current_users
      t.decimal :price, precision: 4, scale: 2


      t.timestamps
    end
  end
end
