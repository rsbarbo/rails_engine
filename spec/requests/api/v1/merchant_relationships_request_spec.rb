require 'rails_helper'

describe "merchant relationships" do
  it "loads the customers with pending invoices associated with one merchant" do
    merchant_1 = Fabricate(:merchant)
    merchant_2 = Fabricate(:merchant)

    customer_pending_1 = get "/api/v1/merchants/#{merchant_1.id}/customers_with_pending_invoices"
    customer_pending_2 = get "/api/v1/merchants/#{merchant_2.id}/customers_with_pending_invoices"

    expect(customer_pending_1.size).to eq(3)
    expect(customer_pending_2.size).to eq(5)

    expect(response).to have_attributes(197)
    expect(response).to have_attributes(28)
  end
end
