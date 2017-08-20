Rails.application.routes.draw do
  resources :clients
  get 'welcome/index'
  root 'welcome#index'
end
