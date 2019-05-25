require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  
	controller :short_urls do
		get '/short_urls/top_100', to: 'short_urls#top_100', as: :short_url_top_100
  end
  resources :short_urls, only: [:new, :index, :create, :show]

  get '/:shortened_url', to: 'short_urls#redirect_to_url', as: :redirect_to_url
  
  root 'short_urls#index'

end
