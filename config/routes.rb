Rails.application.routes.draw do
  devise_for :models
  root 'posts#index'
  resources :posts do
    member do
      get :publish
    end
    resources :comments
  end
end
