class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  attr_accessor :consent, :role

  enum role: {admin: 0, user: 1, developer: 2, advertiser: 3}

  validates :name, presence: true, uniqueness: {case_sensitive: false}, on: :create
  validates :consent, presence: true, acceptance: true, on: :create
  validates :role, presence: true, inclusion: {in: roles}, on: :create

  def nickname_uniqueness
    errors.add(:name, :taken) if User.find_by('LOWER(name) = LOWER(?)', self.name).present?
  end

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
