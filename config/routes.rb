Brandometer::Application.routes.draw do

  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :brands
  resources :tags, only: [:create]
  resources :ratings, only: [:create]
  resources :battles, only: [:create]

  root to: 'static_pages#home'

  match '/test',    to: 'tests#index'

  match '/signup',  to: 'users#new'
  match '/finish',  to: 'users#additional_info'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/tag',    to: 'tags#new', via: :get
  match '/tag/:id',to: 'tags#new'

  match '/rate',    to: 'ratings#new', via: :get
  match '/rate/:id',to: 'ratings#new'

  match '/battle', to: 'battles#new', via: :get
  match '/battle/:brand1/:brand2', to: 'battles#new'

  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
