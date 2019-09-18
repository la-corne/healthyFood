Rails.application.routes.draw do
  resources :diseases
  resources :posts
  resources :comments
  resources :users
  resources :recipes
  resources :saved_recipes
  resources :saved_posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#index'
  root 'welcome#home'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'saved', to: 'users#my_saved'
  post 'save_post', to: 'users#add_post_to_saves'
  post 'save_recipe', to: 'users#add_recipe_to_saves'

  get 'contact_us', to: 'welcome#contact_us'

  get 'search', to: 'searches#search'


end
