class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :provider
      t.string :uid
      t.text   :extra, :null => true
      t.references :user

      t.timestamps
    end
    add_index :user_accounts, :user_id
  end
end
