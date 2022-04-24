class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :version, null: false, default: 1
      t.references :user, null: false, index: true
      t.timestamps
    end
  end
end
