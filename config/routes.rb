Rails.application.routes.draw do
	root 'static_pages#home'
	resources :profiles
  devise_for :users, path: '/', controllers: { registrations: "registrations" }
end
