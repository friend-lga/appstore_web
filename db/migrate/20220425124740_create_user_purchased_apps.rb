class CreateUserPurchasedApps < ActiveRecord::Migration[7.0]
  def change
    create_table :user_purchased_apps do |t|
      t.references :user, index: true
      t.references :app, index: true
      t.timestamps null: false
    end
  end
end
