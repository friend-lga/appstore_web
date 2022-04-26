class Category < ApplicationRecord
  has_many :app_categories
  has_many :apps, through: :app_categories, inverse_of: :categories, source: :app

  validates :title, presence: true, allow_blank: false, uniqueness: true, on: :create
end
