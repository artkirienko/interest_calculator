Rails.application.routes.draw do
  resources :payments
  resources :loans
  resources :tariffs
  resources :clients
  get 'welcome/index'
  root 'welcome#index'
end
