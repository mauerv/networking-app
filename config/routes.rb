Rails.application.routes.draw do
  get 'connection_requests/new'
  get 'connection_requests/create'
  get 'contacts/index'
	resources :profiles
	resources :connection_requests, only: [:new, :create]
  devise_for :users, path: '/', controllers: { registrations: "registrations" }
 
  authenticated :user do
  	root 'feed#index', as: :authenticated_root
  end

  root 'static_pages#home'
end
