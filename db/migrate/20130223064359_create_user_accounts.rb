class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :provider
      t.string :uid
      t.references :user

      t.timestamps
    end
    add_index :user_accounts, :user_id
  end
end
