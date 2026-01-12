Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # Below are CRUD routes
  # Index - Shows all the records
  # get "/products", to: "products#index"
  # New - Renders a form for creating a new record
  # get "/products/new", to: "products#new"
  # Create - Processes the new form submission, handling errors and creating the record
  # post "/products", to: "products#create"
  # Show - Renders a specific record for viewing
  # get "/products/:id", to: "products#show"
  # Edit - Renders a form for updating a specific record
  # get "/products/:id/edit", to: "products#edit"
  # Update (partial) - Handles the edit form submission, handling errors and updating specific attributes of the record, and typically triggered by a PATCH request
  # patch "/products/:id", to: "products#update"
  # Update (full) - Handles the edit form submission, handling errors and updating the entire record, and typically triggered by a PUT request.
  # put "products/:id", to: "products#update"
  # Destroy - Handles deleting a specific record
  # delete "/products/:id", to: "products#destroy"

  # All CRUD routes at once in one line
  root "products#index"
  resources :products do
    resources :subscribers, only: [ :create ]
  end
  resource :unsubscribe, only: [ :show ]
end
