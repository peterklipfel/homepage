Blog::Engine.routes.draw do
  match '/:id', to: "posts#show"
  resources :posts

  root to: 'posts#index'

end
