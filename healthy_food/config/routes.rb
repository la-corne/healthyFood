Rails.application.routes.draw do
  resources :diseases
  resources :posts
  resources :comments
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#index'
  root 'welcome#home'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'contact_us', to: 'welcome#contact_us'

  #get 'login', to: 'welcome#login'
  #get 'signup', to: 'welcome#signup'
  # get 'home', to: 'welcome#home'
  #get 'profile', to: 'welcome#profile'
   get 'saved', to: 'welcome#saved'
  #get 'service', to: 'welcome#service'
end
