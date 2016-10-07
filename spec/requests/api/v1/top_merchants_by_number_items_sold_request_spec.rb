require 'rails_helper'

describe "top merchants by number of items sold" do
  it "returns top merchants by number of items sold" do
    merchant = Fabricate(:merchant, name: "Amazon", id: 1)
    invoice1 = Fabricate(:invoice)
    invoice2 = Fabricate(:invoice)
    invoice1.update_attribute(:merchant_id, merchant.id)
    invoice2.update_attribute(:merchant_id, merchant.id)
    transaction1 = Fabricate(:transaction, result: "success")
    transaction2 = Fabricate(:transaction, result: "success")
    transaction1.update_attribute(:invoice_id, invoice1.id)
    transaction2.update_attribute(:invoice_id, invoice2.id)
    invoice_item1 = Fabricate(:invoice_item, quantity: 2, unit_price: 10055)
    invoice_item2 = Fabricate(:invoice_item, quantity: 2, unit_price: 20055)
    invoice_item1.update_attribute(:invoice_id, invoice1.id)
    invoice_item2.update_attribute(:invoice_id, invoice2.id)
    get "/api/v1/merchants/most_items?quantity=2"

    parsed_merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchants.count).to eq(1)
  end
end
