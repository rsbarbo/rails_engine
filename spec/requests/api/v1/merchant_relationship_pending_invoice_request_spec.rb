require 'rails_helper'

describe "merchant relationships" do
  it "loads the customers with pending invoices associated with one merchant" do
    merchant_1 = Fabricate(:merchant)

    customer_pending_1 = get "/api/v1/merchants/#{merchant_1.id}/customers_with_pending_invoices"

    expect(customer_pending_1.size).to eq(8)
  end
end
