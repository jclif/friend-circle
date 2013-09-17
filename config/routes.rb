FriendCircle::Application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show]

  resource :session, only: [:new, :create, :destroy] do
    member do
      get "password_reset_new"
      post "password_reset_create"
    end
  end

end
