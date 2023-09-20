Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :activities, only: [:new, :create]
  end
  root "categories#index"
end
