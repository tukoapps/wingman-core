class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer :mobile_user_id
      t.integer :bar_id
      t.integer :elapsed_minutes

      t.timestamps
    end
  end
end
