Rails.application.routes.draw do
  get "/api/v1/invoices", to: "api/v1/invoices#index"
end
