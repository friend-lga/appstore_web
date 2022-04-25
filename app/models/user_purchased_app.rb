class UserPurchasedApp < ApplicationRecord
  belongs_to :users
  belongs_to :apps
end
