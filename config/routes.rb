Rails.application.routes.draw do
  post 'device_versions', to: "device_versions#create" , as: "device_version"
  delete 'device_versions/:id', to: "device_versions#destroy", as: "delete_device_version"
  resources :versions
  resources :programs
  resources :issues
  resources :devices
  resources :targets
  resources :esps
  root to: "devices#index"
  devise_for :users, :skip => :registration


  get "/esps/:mac/version", to: "esps#version" , as: "checkVersion"
  get "/esps/:mac/:page/:size", to: "esps#sendData" , as: "sendData"
  get "/esps/:mac/updated", to: "esps#updated" , as: "updated"
  post "/esps/:mac/error/:message", to: "esps#error" , as: "error"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
