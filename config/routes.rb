Rails.application.routes.draw do

  root 'static_pages#home'

  resources :gossips do
  	resources :comments
  end

  get 'error', to: "static_pages#error", as: "error"

end
