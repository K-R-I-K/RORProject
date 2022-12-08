Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'students#index'
  resources :students
  get "/pages" => "pages#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
