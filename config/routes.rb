Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show, :destroy] do
    resources :activities, only: [:index, :show]
  end
  root "categories#index"
end
