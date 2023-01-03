Rails.application.routes.draw do
  resources :shops
  resources :cars
  
  resource :user, only: [] do 
    get "sign_up"
    post "register"

    get "sign_in"
    post "login"

    delete "logout"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"
end
