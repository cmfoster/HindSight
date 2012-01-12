Hindsight::Application.routes.draw do
  get "hinds/show"

  devise_for :users do
    match '/login' => 'devise/sessions#new'
    match '/signout' => 'devise/sessions#destroy'
    root :to => "home#index"
  end

  root :to => 'home#index'
  
  resources :users
  resources :posts
  resources :hinds
  
end
