Rails.application.routes.draw do

  devise_for :moussaillons
  root to: "static_pages#home"

  resources :gossips do
  	resources :comments
  end

  get 'error', to: "static_pages#error", as: "error"

end

