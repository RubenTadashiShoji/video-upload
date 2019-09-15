Rails.application.routes.draw do
  get 'contacts/new'

  get 'contacts/create'

  get 'contacts/thanks'

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  get 'static_pages/home'
  get '/help', to:'contacts#new'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/video_requirements', to:'static_pages#video_requirements' 
  
  resources :microposts

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :contacts
  resources :account_activations, only: [:edit]
  resources :password_resets, only:[:new, :create, :edit, :update]
  resources :microposts, only:[:create, :destroy]
end 