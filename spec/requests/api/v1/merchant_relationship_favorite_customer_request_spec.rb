require 'rails_helper'

describe "merchant relationships" do
  it "loads the customers with pending invoices associated with one merchant" do
    merchant_1 = Fabricate(:merchant)
    merchant_2 = Fabricate(:merchant)

    favorite_customer_one = get "/api/v1/merchants/#{merchant_1.id}/favorite_customer"

    expect(favorite_customer_one.size).to eq(8)
  end
end
