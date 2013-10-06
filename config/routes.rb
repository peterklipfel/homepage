Homepage::Application.routes.draw do
  get 'capstone', to: 'posts#capstone'

  get 'blog', to: 'posts#index'
  get 'blog/:id', to: 'posts#show'
  get "/404", :to => "errors#not_found"
  get "/500", :to => "errors#internal_error"

  resources :projects, only: [:index, :show]

  root :to => 'landing_pages#index'
end
