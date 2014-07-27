class ChangePhoneNumberDataType < ActiveRecord::Migration
  def change
    remove_column :bars, :phone_number
    add_column :bars, :phone_number, :string
  end
end
