Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'items/new'

  resources :users, only: [:show] do
    resources :items, only: [ :create, :destroy]
  end

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

end
