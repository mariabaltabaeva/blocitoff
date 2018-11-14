Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
    resources :items, only: [ :create, :destroy]
  end

  resources :items, only: [:new]
  get 'about' => 'welcome#about'

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root to: 'welcome#index'

end
