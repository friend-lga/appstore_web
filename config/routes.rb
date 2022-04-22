Rails.application.routes.draw do
  namespace :users do
    get 'registration/new'
    get 'registration/create'
    get 'sessions/new'
    get 'sessions/create'
  end
  root "home#index"

  get '/developer' => 'developer#index', as: "developer"
  get '/advertiser' => 'advertiser#index', as: "advertiser"

  devise_for :users, skip: %w[sessions registrations passwords confirmations]

  devise_scope :user do
    get '/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post '/sign_in' => 'users/sessions#create', as: 'user_session'
    get '/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post '/sign_up' => 'users/registrations#create', as: 'user_registration'
    delete '/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
