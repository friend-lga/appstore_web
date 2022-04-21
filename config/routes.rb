Rails.application.routes.draw do
  get 'advertiser/index'
  get 'developer/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/developer' => 'developer#index', as: "developer"
  get '/advertiser' => 'advertiser#index', as: "advertiser"
end
