Twitter::Application.routes.draw do
  devise_for :users

  resources :users, :only => [:edit, :update, :index]
resources :tweets do
collection do
post :all
end
end
resources :friends do
collection do
post :request
end
member do
post :follow
end
end
resources :avatars
root to: "pages#index"

match "/pages" => "pages#friendindex"
match "/admin/friends/create/:id" => "friends#create"
end

