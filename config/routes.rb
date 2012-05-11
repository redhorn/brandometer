Brandometer::Application.routes.draw do

  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :brands
  resources :tags, only: [:create]

  root to: 'static_pages#home'

  match '/test',    to: 'tests#index'

  match '/signup',  to: 'users#new'
  match '/finish',  to: 'users#additional_info'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/tag',    to: 'tags#show', via: :get
  match '/tag/:id',to: 'tags#show'

  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
