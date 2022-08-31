Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :urls, only: :index do
    collection do
      get  :add_new_url
    end
  end
  root "urls#index"
end
