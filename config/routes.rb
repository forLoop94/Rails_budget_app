Rails.application.routes.draw do
  resources :categories, only: [:index, :show, :destroy] do
    resources :activities, only: [:index, :show]
  end

  resources :users
  root "categories#index"
end
