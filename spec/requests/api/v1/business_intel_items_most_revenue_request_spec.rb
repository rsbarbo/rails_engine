require 'rails_helper'

describe "The most revenue for items" do
  it "give back the top number of merchants organized by revenue" do
    merchant_1 = Fabricate(:merchant, id: 1)
    merchant_2 = Fabricate(:merchant, id: 2)
    merchant_3 = Fabricate(:merchant, id: 3)

    invoice_1  = Fabricate(:invoice, id: 1, merchant_id: merchant_1.id)
    invoice_2 = Fabricate(:invoice, id: 2, merchant_id: merchant_2.id)
    invoice_3 = Fabricate(:invoice, id: 3, merchant_id: merchant_3.id)

    Fabricate(:invoice_item, invoice_id: invoice_1.id, unit_price: 9000, quantity: 1)
    Fabricate(:transaction, invoice_id: invoice_1.id, result: "success")
    Fabricate(:invoice_item, invoice_id: invoice_2.id, unit_price: 9000, quantity: 2)
    Fabricate(:transaction, invoice_id: invoice_2.id, result: "success")
    Fabricate(:invoice_item, invoice_id: invoice_3.id, unit_price: 5000, quantity: 2)
    Fabricate(:transaction, invoice_id: invoice_3.id, result: "success")

    get '/api/v1/items/most_revenue?quantity=2'
    expect(response).to be_success

    parse_customer = JSON.parse(response.body)
    expect(parse_customer.count).to eq(2)
  end
end
