Homepage::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.
  match 'blog', to: 'posts#index'
  match 'blog/:id', to: 'posts#show'
  match 'resume', to: 'resume#index'
  match "/404", :to => "errors#not_found"
  match "/500", :to => "errors#internal_error"

  resource :landing_pages
  resource :projects
  resource :errors

  root :to => 'landing_pages#index'

end
