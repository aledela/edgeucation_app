Rails.application.routes.draw do
  root 'colleges#index'
  get '/about', to: 'static_pages#about'
  resources :colleges
  resources :searches
end
