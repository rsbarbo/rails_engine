Rails.application.routes.draw do

  get "/api/v1/merchants/find", to: "api/v1/merchants/search#show"
  get "/api/v1/merchants/random", to: "api/v1/merchants/search#show"
  get "/api/v1/merchants/find_all", to: "api/v1/merchants/search#index"
  get "/api/v1/transactions/find", to: "api/v1/transactions/search#show"
  get "/api/v1/transactions/random", to: "api/v1/transactions/search#show"
  get "/api/v1/transactions/find_all", to: "api/v1/transactions/search#index"
  get "/api/v1/customers/find", to: "api/v1/customers/search#show"
  get "/api/v1/customers/random", to: "api/v1/customers/search#show"
  get "/api/v1/customers/find_all", to: "api/v1/customers/search#index"

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end

      namespace :items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"

      end

      resources :invoices, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
