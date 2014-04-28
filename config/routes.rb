ContribHub::Application.routes.draw do
  root :to => "home#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/signout" => "sessions#destroy"

  resources :users, only: [:show, :edit, :update] do
    resources :wannahelp, only: [:index]
  end

  post '/needhelp/toggle' => "repos#toggle_need_help"
  post '/wannahelp/toggle' => 'wannahelp#toggle'

  post '/tagging/update_tags' => 'tagging#update_tags'
  post '/repos/update_user_description' => "repos#update_user_description"

  get '/repos/:project_name' => 'repos#show'
  get '/users_map' => "home#users_map"

  get '/users/:id/edit' => 'users#edit'
  put '/users/:id' => 'users#update'
end
