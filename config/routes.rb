Rails.application.routes.draw do
  root 'posts#index'
  
  #get '/posts', to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/posts/:id', to: 'posts#show'
  resources :posts do
    resources :comments
  end
end
