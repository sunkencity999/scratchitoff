Rails.application.routes.draw do

  devise_for :users
  resources :users

  resources :lists do 
    resources :posts, except: [:index]
  end

  get 'welcome/index'

  get 'welcome/about'

  get '/lists/' => 'lists#index'

    root to: 'welcome#index'
end
