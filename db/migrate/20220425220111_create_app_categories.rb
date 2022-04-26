class CreateAppCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :app_categories do |t|
      t.references :app, null: false, foreign_key: true, index: true
      t.references :category, null: false, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
