require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  match '/auth/mixin/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: :get
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :mx_apps, only: [:index, :new, :create, :show, :edit, :update, :destroy], param: :number
  resources :audited_mx_apps, only: [:update], param: :number

  namespace :admin do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
    resource :account, only: [:edit, :update]

    resources :users, only: [:index]

    root to: 'dashboard#index'
  end

  mount Sidekiq::Web => '/sidekiq'
  mount StatusPage::Engine => '/'
  #mount ActionCable.server => '/cable'
  root to: 'home#index'
end
