Rails.application.routes.draw do
  resources :tariffs
  resources :clients
  get 'welcome/index'
  root 'welcome#index'
end
