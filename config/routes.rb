Rails.application.routes.draw do
	resources :profiles
  resources :contacts, only: [:index, :destroy]
	resources :connection_requests, only: [:new, :create, :update, :destroy ]
  
  devise_for :users, path: '/', controllers: { registrations: "registrations" }
 
  authenticated :user do
  	root 'feed#index', as: :authenticated_root
  end

  root 'static_pages#home'
end
