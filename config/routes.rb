Rails.application.routes.draw do

  get "/api/v1/invoices/find", to: "api/v1/invoices/search#show"
  get "/api/v1/invoices/find_all", to: "api/v1/invoices/search#index"
  get "/api/v1/merchants/find", to: "api/v1/merchants/search#show"
  get "/api/v1/merchants/random", to: "api/v1/merchants/search#show"
  get "/api/v1/merchants/find_all", to: "api/v1/merchants/search#index"
  get "/api/v1/transactions/find", to: "api/v1/transactions/search#show"
  get "/api/v1/transactions/random", to: "api/v1/transactions/search#show"
  get "/api/v1/transactions/find_all", to: "api/v1/transactions/search#index"


  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
