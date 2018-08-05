require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do

  namespace :admin do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
    resource :account, only: [:edit, :update]

    root to: 'dashboard#index'
  end

  mount Sidekiq::Web => '/sidekiq'
  mount StatusPage::Engine => '/'
  #mount ActionCable.server => '/cable'
  root to: 'home#index'
end
