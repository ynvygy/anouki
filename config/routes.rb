Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  get '/about', to: "pages#about"
  get '/userlist', to: "users#index"
  resources :posts do
  	resources :comments
  end
  resources :contacts
  resources :workcategories do
    resources :drawings do
      collection do
        get :search
      end
    end
  end
  resources :drawings
end
