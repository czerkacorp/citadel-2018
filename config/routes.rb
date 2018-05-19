Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :users

  namespace :admin do
    resources :settings
  end

  root 'pages#index'
end
