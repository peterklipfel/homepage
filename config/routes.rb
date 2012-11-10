Homepage::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  mount Blog::Engine, at: '/blog'

  resource :landing_pages
  resource :projects

  root :to => 'landing_pages#index'
end
