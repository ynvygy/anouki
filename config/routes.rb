Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  get '/about', to: "pages#about"
  resources :posts
end
