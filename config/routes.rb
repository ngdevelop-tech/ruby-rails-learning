Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'about', to: 'about#index'

  # Root route, you can also write like `get "", to: "main#index"`
  root to: 'main#index'

  # registration routes
  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  # session routes
  delete 'logout', to: 'session#destroy'
  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'

  # update passwords
  get 'password', to: 'passwords#edit'
  patch 'password', to: 'passwords#update'

  # reset password
  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'
end
