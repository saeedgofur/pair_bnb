Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create,:show,:edit,:update,:destroy] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  
  resources :listings do
    resources :reservations
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/welcome" => "welcome#index", as: "welcome"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
end
