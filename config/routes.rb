Rails.application.routes.draw do
	resources :profiles, only: [:index, :show, :edit, :update]
  resources :contacts, only: [:index, :destroy]
	resources :connection_requests, path: 'request-manager', only: [:index, :new, :create, :update, :destroy ]
  delete 'connection_requests/withdraw/:id', to: 'connection_requests#withdraw'
  devise_for :users, path: '/', controllers: { registrations: "registrations" }
 
  authenticated :user do
  	root 'feed#index', as: :authenticated_root
  end

  root 'static_pages#home'
end
