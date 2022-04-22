class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  attr_accessor :consent

  validates :username, presence: true, uniqueness: {case_sensitive: false}, on: :create
  validates :consent, presence: true, acceptance: true, on: :create

  def nickname_uniqueness
    errors.add(:username, :taken) if User.find_by('LOWER(username) = LOWER(?)', self.username).present?
  end

end
