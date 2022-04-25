class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :version, null: false, default: 1
      t.string :ref_id, null: false, default: "", index: { unique: true } # yandex.maps
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.timestamps null: false
    end
  end
end
