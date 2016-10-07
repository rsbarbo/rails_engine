require 'rails_helper'

describe "merchant relationships" do
  it "loads the customers with pending invoices associated with one merchant" do
    merchant_1 = Fabricate(:merchant)

    favorite_customer_1 = get "/api/v1/merchants/#{merchant_1.id}/customers_with_pending_invoices"
    
    expect(favorite_customer_1).to eq(200)
  end
end
