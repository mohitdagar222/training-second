Rails.application.routes.draw do
  
  post "posts/search" => "posts#search"
  post "/posts/:id/edit" => "posts#edit"
  post "/posts/:id" => "posts#show"

  root "posts#index"
    resources :posts 

      # resources :posts do
      #   member do
      #    post :edit
      #   end
      # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
