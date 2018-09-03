Rails.application.routes.draw do

  resource :users, only: [:show]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'welcome/index'

  get 'welcome/about'

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root to: 'welcome#index'

end
