class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  has_many :apps, inverse_of: :author, foreign_key: :author_id
  has_many :user_purchased_apps
  has_many :purchased_apps, through: :user_purchased_apps, inverse_of: :owners, source: :app

  attr_accessor :consent

  enum role: %w[admin user developer advertiser]

  validates :name, presence: true, allow_blank: false, uniqueness: {case_sensitive: false}, on: :create
  validates :consent, presence: true, acceptance: true, on: :create
  validates :role, presence: true, inclusion: {in: User.roles.keys}, on: :create

  def self.role_name(role)
    case role
    when 'admin'
      return 'Администратор'
    when 'user'
      return 'Пользователь'
    when 'developer'
      return 'Разработчик'
    when 'advertiser'
      return 'Рекламодатель'
    end
  end

  def self.role_names
    self.roles.map { |role, value| [role_name(role), value] }.to_h
  end

end
