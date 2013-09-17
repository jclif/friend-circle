FriendCircle::Application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :friend_elipses, only: [:index]
  end

  resource :session, only: [:new, :create, :destroy] do
    member do
      get "password_reset_new"
      post "password_reset_create"
    end
  end

  resources :friend_elipses, only: [:new, :create, :edit, :update, :show, :destroy]

  resources :posts, only: [:new, :create, :show, :destroy]
end
