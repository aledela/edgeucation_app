Rails.application.routes.draw do
  root 'colleges#index'
  # root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :colleges
  resources :searches
end
