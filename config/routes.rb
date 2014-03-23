HpComments::Application.routes.draw do
  
  resources :users, only: [:create, :new, :show, :index] do
    collection do
      get 'currentUser'
      # get 'badges'
    end
  end
  
  resources :comment_favorites, only: [:index]
  
  resource :session, only: [:create, :destroy, :new]
  
  resources :articles do
    resources :comments, defauts: { format: :json } do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
  end
  
  resources :comment_favorites 
  
  resources :badges, only: [:index]
  
  resources :user_badges, only: [:index]
  
  resources :comments do
    
  end
  
  root to: "application#index"

end
