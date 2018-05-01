Rails.application.routes.draw do

  root 'static_pages#home'

  resources :gossips do
  	resources :comments
  end

  #Nested routes: permet de créer des URL et méthodes pour les commentaires, dépendantes de celles des gossips puisque les deux sont liés

  get 'error', to: "static_pages#error", as: "error"

end
