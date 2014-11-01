Rails.application.routes.draw do


  constraints subdomain: 'api' do
    namespace :api, path: '/' do
      resources :users
      resources :lists
      resources :posts
    end
  end

  devise_for :users
  
  #this is the route for the calendar, so it is related to users. 
  resources :users do
    resource :calendar, only: [:show], controller: :calendar
    resource :event, controller: :event 
      root to: "calendar#show"
  end

 
 

  resource :user, only: [:edit] do 
    collection do 
      patch 'update_password'
    end
  end
  
  
  devise_scope :user do
    authenticated :user do
      root :to => 'lists#index'
    end
    unauthenticated :user do
      root :to => 'welcome#index', as: :unauthenticated_root
      end
  end

  resources :lists do 
    resources :posts, except: [:index]
  end

  match 'lists/lists/posts/complete/' => 'posts#complete', :via => :post

  get 'welcome/index'

  get 'welcome/about'

  get '/lists/' => 'lists#index'

  get 'calendar/show'

    
end
