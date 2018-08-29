Rails.application.routes.draw do
  resource :users, only: [:show]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'welcome/index'

  get 'welcome/about'

  root to: 'users#show'

end
