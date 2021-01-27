class AddConfirmableToDeviseUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :confirmation_token
      t.string :unconfirmed_email
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end

    add_index :users, :confirmation_token, unique: true
  end
end
