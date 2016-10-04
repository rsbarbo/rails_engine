Rails.application.routes.draw do

  get "/api/v1/invoices/find", to: "api/v1/invoices/search#show"


  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
    end
  end
end
