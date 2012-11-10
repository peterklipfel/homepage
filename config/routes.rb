Homepage::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.
  match 'blog', to: 'posts#index'
  match 'blog/:id', to: 'posts#show'
  
  resource :landing_pages
  resource :projects

  root :to => 'landing_pages#index'
end
