Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments
  end

  resources :posts do
    member do
      post :publish
      get :unpublish
    end
  end
end
