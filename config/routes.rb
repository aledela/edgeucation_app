Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/home', to: 'static_pages#home'
  resources :colleges
  resources :searches
end
