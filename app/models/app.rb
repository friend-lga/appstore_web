class App < ApplicationRecord

  belongs_to :author, class_name: :User
  has_one_attached :icon
  has_one_attached :package
  has_many :user_purchased_apps
  has_many :owners, class_name: :User, through: :user_purchased_apps, inverse_of: :purchased_apps, source: :users

  validates :title, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :version, presence: true, on: :create
  validates :ref_id, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :author, presence: true, on: :create
  validate -> { icon.attached? }, on: :create
  validate -> { package.attached? }, on: :create

  enum category: {games: 0, music: 1, video: 2, photo: 3, creativity: 4, art: 5, navigation: 6, financial: 7, science: 8, shopping: 9, food: 10, medical: 11, security: 12, home: 13, tools: 14}

  def self.category_name(category)
    case category
    when 'games'
      return 'Игры'
    when 'music'
      return 'Музыка'
    when 'video'
      return 'Видео'
    when 'photo'
      return 'Рекламодатель'
    when 'creativity'
      return 'Креативность'
    when 'art'
      return 'Искусство'
    when 'navigation'
      return 'Навигация'
    when 'financial'
      return 'Финансы'
    when 'science'
      return 'Наука'
    end
  end

  def self.category_names
    self.categories.map { |category, value| [category_name(category), value] }.to_h
  end

end
