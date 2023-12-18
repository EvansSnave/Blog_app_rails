Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  
  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :likes, only: [:create, :destroy]
      resource :deletion, only: [:destroy], controller: 'post_deletions'
      resources :comments, only: [:new, :create, :show] do
        resource :deletion, only: [:destroy], controller: 'comment_deletions'
      end
      
    end
  end
end
