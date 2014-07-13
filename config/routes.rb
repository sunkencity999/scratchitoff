Rails.application.routes.draw do

  resources :users
  devise_for :users
  
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

    
end
