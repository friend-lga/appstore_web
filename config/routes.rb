Rails.application.routes.draw do
  root "home#index"

  get '/developer' => 'developer#index', as: "developer"
  get '/advertiser' => 'advertiser#index', as: "advertiser"

  devise_for :users, skip: %w[sessions registrations passwords confirmations]

  devise_scope :user do
    get '/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post '/sign_in' => 'users/sessions#create', as: 'user_session'
    get '/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post '/sign_up' => 'users/registrations#create', as: 'user_registration'
    match '/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session', via: [:get, :delete]
  end

  ActiveAdmin.routes(self)
end
