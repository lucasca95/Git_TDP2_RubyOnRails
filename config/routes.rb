Rails.application.routes.draw do
  resources :versions
  resources :programs
  resources :issues
  resources :devices
  resources :targets
  resources :esps
  devise_for :users
  root to: "devices#index"


  get "/esps/:mac/version", to: "esps#version" , as: "checkVersion"
  get "/esps/:mac/:page/:size", to: "esps#sendData" , as: "sendData"
  get "/esps/:mac/updated", to: "esps#updated" , as: "updated"
  #get "/esps/:mac/error/:message", to: "esps#error" , as: "error"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
