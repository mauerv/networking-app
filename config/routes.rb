Rails.application.routes.draw do
  resources :contacts, only: [:index, :destroy]
	resources :profiles
	resources :connection_requests, only: [:new, :create, :destroy, :update]
  devise_for :users, path: '/', controllers: { registrations: "registrations" }
 
  authenticated :user do
  	root 'feed#index', as: :authenticated_root
  end

  root 'static_pages#home'
end
