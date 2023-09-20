Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :activities, only: [:new, :create]
  end
  root "categories#index"
  # get "/welcome_page", to: "welcome_page#index"
  resources :welcome_page, only: [:index]
end
