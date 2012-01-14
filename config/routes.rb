Hindsight::Application.routes.draw do
  get "hinds/show"

  devise_for :users do
    match '/login' => 'devise/sessions#new'
    match '/signout' => 'devise/sessions#destroy'
    root :to => "home#index"
    resources :posts
    resources :hinds
  end

  root :to => 'home#index'
  
  resources :users, :only => [:show]
  resources :posts, :only => [:show]
  resources :hinds, :only => [:show]
  
end
