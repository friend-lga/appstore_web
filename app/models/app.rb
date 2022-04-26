class App < ApplicationRecord

  belongs_to :author, class_name: :User
  has_one_attached :icon
  has_one_attached :package
  has_many :user_purchased_apps
  has_many :owners, class_name: :User, through: :user_purchased_apps, inverse_of: :purchased_apps, source: :users
  has_many :app_categories
  has_many :categories, through: :app_categories, inverse_of: :apps, source: :category

  validates :title, presence: true, allow_blank: false, on: :create
  validates :description, presence: true, allow_blank: false, on: :create
  validates :version, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}, on: :create
  validates :ref_id, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }, on: :create
  validates :author, presence: true, on: :create
  # validates :categories, presence: true, on: :create
  validate -> { icon.attached? }, on: :create
  validate -> { package.attached? }, on: :create

end
