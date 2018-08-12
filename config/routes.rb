require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  match '/auth/mixin/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: :get
  delete '/logout', to: 'sessions#destroy', as: :logout

  # 应用管理
  resources :mx_apps, only: [:index, :new, :create, :show, :edit, :update, :destroy], module: 'mx_apps', param: :number do
    namespace :store do
      resources :products, only: [:index, :new, :create, :edit, :update], controller: :mx_app_store_products
      resources :users, only: [:index, :show], controller: :store_mx_app_users
    end
  end

  resources :audited_mx_apps, only: [:update], param: :number

  # 买家视角的商店
  resources :stores, only: [:show], module: 'stores', param: :number do
    get 'login', to: 'sessions#new', as: :login
    match '/auth/mixin/callback', to: 'sessions#create', via: [:get, :post]
    match '/auth/failure', to: 'sessions#failure', via: :get
    delete '/logout', to: 'sessions#destroy', as: :logout

    resources :products, only: [:show]
  end

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
