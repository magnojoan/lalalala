Twitter::Application.routes.draw do
  devise_for :users

resources :users, :only => [:edit, :update]
resources :tweets
resources :friends
resources :avatars

match "/friends/request", :to => "friends#request"
match "/friends/:id", :to => "friends#follow"
match "/tweets/all", :to => "tweets#all"

  root to: "pages#index"
end

