Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
      end

      namespace :items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"

      end

      namespace :merchants do
        get "/find", to: "search#show"
        get "/random", to: "search#show"
        get "/find_all", to: "search#index"
      end

      namespace :transactions do
        get "/find", to: "search#show"
        get "/random", to: "search#show"
        get "/find_all", to: "search#index"
      end

      namespace :customers do
        get "/find", to: "search#show"
        get "/random", to: "search#show"
        get "/find_all", to: "search#index"
      end

      resources :invoices, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
