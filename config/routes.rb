Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'#, as: 'signup'
  post '/signup', to: 'users#create'
  resources :users # Creates the REST routes needed in controllers
end
