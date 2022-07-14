Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"
  get "home/index"
  authenticate :admin do
    resources :categories
    resources :products
  end
  resource :cart, only: [:show, :update]
end
