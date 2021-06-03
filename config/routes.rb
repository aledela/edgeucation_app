Rails.application.routes.draw do
  # root 'colleges#index'
  root 'searches#new'
  # root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/searchbar', to: 'static_pages#searchbar'
  resources :colleges
  resources :searches
end
