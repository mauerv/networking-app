Rails.application.routes.draw do
	resources :profiles, only: [:index, :show, :edit, :update] do
		collection do
			match 'search' => 'profiles#search', via: [:get, :post], as: :search
		end
	end
  resources :contacts, only: [:index, :destroy]
	resources :connection_requests, path: 'request-manager', only: [:index, :create, :update, :destroy ]
  delete 'request-manager/withdraw/:id', to: 'connection_requests#withdraw'
  devise_for :users, path: '/', controllers: { registrations: "registrations" }
 
  authenticated :user do
  	root 'feed#index', as: :authenticated_root
  end

  root 'static_pages#home'
  get '/account', to: 'static_pages#account'
end
