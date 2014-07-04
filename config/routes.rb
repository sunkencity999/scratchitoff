Rails.application.routes.draw do

  devise_for :users

  resources :lists do 
    resources :posts, except: [:index]
  end

  get 'welcome/index'

  get 'welcome/about'

  get 'lists/index'

    root to: 'welcome#index'
end
