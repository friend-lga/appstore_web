class CreateUserPurchasedApps < ActiveRecord::Migration[7.0]
  def change
    create_table :user_purchased_apps do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :app, null: false, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
