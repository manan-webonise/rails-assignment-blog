Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    member do
      get :publish
    end
    resources :comments
  end
end
