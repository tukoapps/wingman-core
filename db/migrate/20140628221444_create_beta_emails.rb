class CreateBetaEmails < ActiveRecord::Migration
  def change
    create_table :beta_emails do |t|

      t.string :email,              null: false, default: ""

      t.timestamps
    end
  end
end
