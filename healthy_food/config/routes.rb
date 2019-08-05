Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#welcome'
  get 'login', to: 'welcome#login'
  get 'signup', to: 'welcome#signup'
  get 'contact_us', to: 'welcome#contact_us'
  get 'home', to: 'welcome#home'
  get 'profile', to: 'welcome#profile'
  get 'saved', to: 'welcome#saved'
  get 'service', to: 'welcome#service'
end
