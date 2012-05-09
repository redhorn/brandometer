Brandometer::Application.routes.draw do

  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/complete',to: 'users#additional_info'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
