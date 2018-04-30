Rails.application.routes.draw do
  root 'static_pages#home'
  resources :gossips
  get 'error', to: "static_pages#error", as: "error"

end
