Hindsight::Application.routes.draw do
  get "hinds/show"

  devise_for :users do
    match '/login' => 'devise/sessions#new'
    match '/signout' => 'devise/sessions#destroy'
    root :to => "home#index"
  end
  
  resources :users do
    get :userposts
    resources :posts do
      resources :tags
      get :autosuggest_tag_subject, :on => :collection
    end
  end
    

  root :to => 'home#index'
  resources :home do
    get :popularposts
  end
  
  resources :users, :only => [:show]
  resources :posts, :only => [:show] do
    resources :comments, :exclude => [:destroy]
  end
  resources :tags, :only => [:show, :index] 
  
  match '/tagposts' => 'tags#tagposts'
  match '/browseupdate' => 'tags#browseupdate'
  
end
