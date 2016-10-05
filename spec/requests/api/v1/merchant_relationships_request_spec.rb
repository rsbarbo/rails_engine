require 'rails_helper'

describe "merchant relationships" do
  it "loads the customers with pending invoices associated with one merchant" do
    merchant_1 = Fabricate(:merchant)
    merchant_2 = Fabricate(:merchant)

    customer_pending_1 = load_data("/api/v1/merchants/#{merchant_1.id}/customers_with_pending_invoices")
    customer_pending_2 = load_data("/api/v1/merchants/#{merchant_2.id}/customers_with_pending_invoices")


    expect(customer_pending_1.size).to eq(3)
    expect(customer_pending_2.size).to eq(5)

    expect(customer_pending_1).to eq(197)
    expect(customer_pending_2).to eq(28)
    assert_response_has_attribute 197, pending_customer_one
    assert_response_has_attribute 28,  pending_customer_two
  end
end
