FriendCircle::Application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show]

  resource :session, only: [:new, :create, :destroy]
end
