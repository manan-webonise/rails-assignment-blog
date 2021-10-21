Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    member do
      get :publish
    end
    resources :comments
  end
end
