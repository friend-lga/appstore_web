class App < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_one_attached :package

  validates :title, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :version, presence: true, on: :create

  enum category: {games: 0, music: 1, video: 2, photo: 3, creativity: 4, art: 5, navigation: 6, financial: 7, science: 8}
  enum tags: {tag1: 0, tag2: 1, tag3: 2, tag4: 3}

  def categories
    # result = [categories.sample]
    # result.append(categories.except(result).sample)
    # return result
  end

  def tags
    # result = [tags.sample]
    # result.append(tags.except(result).sample)
    # return result
  end

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

  def self.tag_name(tag)
    case tag
    when 'tag1'
      return 'Тэг первый'
    when 'tag2'
      return 'Тэг второй'
    when 'tag3'
      return 'Тэг третий'
    when 'tag4'
      return 'Тэг четвертый'
    end
  end

  def self.tag_names
    self.tags.map { |tag, value| [tag_name(tag), value] }.to_h
  end
end
