Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :activities, only: [:index, :show]
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
