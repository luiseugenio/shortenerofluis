require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :short_urls, only: [:new, :index, :create, :show]
  
  root 'short_urls#index'

end
