class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, default: "", index: { unique: true }
      t.timestamps null: false
    end

    reversible do |change|
      change.up do
        Category.create!(title: 'Игры')
        Category.create!(title: 'Навигация')
        Category.create!(title: 'Финансы')
        Category.create!(title: 'Бизнес')
        Category.create!(title: 'Видео')
        Category.create!(title: 'Аудио')
        Category.create!(title: 'Книги')
        Category.create!(title: 'Покупки')
        Category.create!(title: 'Еда')
        Category.create!(title: 'Здоровье')
        Category.create!(title: 'Дом')
        Category.create!(title: 'Инструменты')
        Category.create!(title: 'Социальное')
        Category.create!(title: 'Развлечения')
        Category.create!(title: 'Путешествия')
        Category.create!(title: 'Работа')
      end
    end
  end
end
