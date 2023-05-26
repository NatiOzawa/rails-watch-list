Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#insdex"
  # root "articles#index"

  # get "/lists", to: "lists#index"
  # get "/lists/new", to: "lists#new"
  # post "/lists", to: "lists#create"
  # get "/lists/:id", to: "lists#show", as: "list"
  # get "/lists/by_name/:name", to: "lists#name", as: "list_by_name"
  # get "/lists/:id/edit", to: "lists#edit", as: "edit_list"
  # patch "/lists/:id", to: "lists#update", as: "update_list"
  # delete "/lists/:id", to: "lists#destroy"
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
