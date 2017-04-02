Rails.application.routes.draw do

  root 'welcome#home'

  get 'signup', to: 'users#new'
  resources :users, except: [:new] do
    resources :teams, only: [:index]
  end
  
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  
  get 'matches', to: 'matches#index'
  resources :teams do 
    resources :matches, except: :index
  end
  
  
  
  
  
  resources :team_memberships

end
