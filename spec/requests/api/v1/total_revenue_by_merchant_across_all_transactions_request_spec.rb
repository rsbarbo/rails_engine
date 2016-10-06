require 'rails_helper'

describe "total revenue by merchant across all transactions" do
  it "returns total revenue by merchant across all transactions" do
    merchant = Fabricate(:merchant)
    invoice1 = Fabricate(:invoice)
    invoice2 = Fabricate(:invoice)
    invoice1.update_attribute(:merchant_id, merchant.id)
    invoice2.update_attribute(:merchant_id, merchant.id)
    invoice_item1 = Fabricate(:invoice_item)
    invoice_item2 = Fabricate(:invoice_item)
    invoice_item1.update_attribute(:invoice_id, invoice1.id)
    invoice_item2.update_attribute(:invoice_id, invoice2.id)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    parsed_revenue = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_revenue).to eq((invoice_item1.quantity * invoice_item1.unit_price) + (invoice_item2.quantity * invoice_item2.unit_price))
  end


end
