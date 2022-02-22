Rails.application.routes.draw do
  get "products/index"
  root "users#index"
  get "/login" => "users#index"
  get "/signup" => "users#signup"
  post "/users" => "users#create"

  get "/products" => "products#index"
  get "/products/create" => "products#new"
  post "/products" => "products#create"
  get "/product/edit/:id" => "products#edit"
  resources :products
  get "/logout" => "products#logout"
  delete "/product/:id" => "products#delete"
  get "/serach" => "products#search"
  get "/products/index" => "products#index"
end
