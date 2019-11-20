Rails.application.routes.draw do
  resources :versions
  resources :programs
  resources :issues
  resources :devices
  resources :targets
  resources :esps
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
