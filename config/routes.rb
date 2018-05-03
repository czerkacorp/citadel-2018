Rails.application.routes.draw do
  resources :users


  namespace :admin do
    resources :settings
    resources :galaxies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
