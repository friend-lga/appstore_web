class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  attr_accessor :consent

  validates :name, presence: true, uniqueness: {case_sensitive: false}, on: :create
  validates :consent, presence: true, acceptance: true, on: :create

  def nickname_uniqueness
    errors.add(:name, :taken) if User.find_by('LOWER(name) = LOWER(?)', self.name).present?
  end

end
