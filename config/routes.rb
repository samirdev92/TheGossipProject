Rails.application.routes.draw do
  root 'static_pages#home'
  resources :gossips
  #delete '/gossips/:id', to: 'gossips#destroy', as: 'delete'  
end
