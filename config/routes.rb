Rails.application.routes.draw do
  resources :employees
  resources :departements
  resources :spendings do
    collection do
      get :chart
      get :slide
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
