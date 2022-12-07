Rails.application.routes.draw do  
  resources :categories
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  resources :patients
  
  resources :doctors
  resources :appointments do
    resources :comments
  end
end
