ContribHub::Application.routes.draw do
  root :to => "home#index"
  match "/auth/:provider/callback" => "sessions#create", via: :all
  match "/signout" => "sessions#destroy", via: :all

  resources :users, only: [:show, :edit, :update] do
    resources :wannahelp, only: [:index]
  end

  post '/needhelp/toggle' => "repos#toggle_need_help"
  post '/wannahelp/toggle' => 'wannahelp#toggle'

  post '/tagging/update_tags' => 'tagging#update_tags'
  match '/repos/update_user_description' => "repos#update_user_description", via: :all

  get '/repos/:project_name' => 'repos#show'
  get '/users_map' => "home#users_map"

  get '/users/:id/edit' => 'users#edit'
  put '/users/:id' => 'users#update'
end
