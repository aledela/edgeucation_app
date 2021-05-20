Rails.application.routes.draw do
  resources :colleges
  root 'colleges#index'
  get '/about', to: 'static_pages#about'
end
