Homepage::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.
  get 'capstone', to: 'posts#capstone'

  get 'blog', to: 'posts#index'
  get 'blog/:id', to: 'posts#show'
  get 'resume', to: 'resume#index'
  get "/404", :to => "errors#not_found"
  get "/500", :to => "errors#internal_error"

  resource :landing_pages, except: [:new, :delete, :show, :create]
  resource :projects
  resource :errors, except: [:new, :delete, :show, :index, :create]

  root :to => 'landing_pages#index'

end
