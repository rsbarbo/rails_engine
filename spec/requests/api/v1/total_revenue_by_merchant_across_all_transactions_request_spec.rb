require 'rails_helper'

describe "total revenue by merchant across all transactions" do
  it "returns total revenue by merchant across all transactions" do
    merchant = Fabricate(:merchant, name: "Amazon", id: 4)
    invoice1 = Fabricate(:invoice, id: 1, merchant_id: merchant.id)
    invoice2 = Fabricate(:invoice, id: 2, merchant_id: merchant.id)
    transaction1 = Fabricate(:transaction, result: "success")
    transaction2 = Fabricate(:transaction, result: "success")
    transaction1.update_attribute(:invoice_id, invoice1.id)
    transaction2.update_attribute(:invoice_id, invoice2.id)
    invoice_item1 = Fabricate(:invoice_item, quantity: 2, unit_price: 10055, invoice_id: invoice1.id)
    invoice_item2 = Fabricate(:invoice_item, quantity: 2, unit_price: 20055, invoice_id: invoice2.id)
    # invoice_item1.update_attribute(:invoice_id, invoice1.id)
    # invoice_item2.update_attribute(:invoice_id, invoice2.id)
    get "/api/v1/merchants/#{merchant.id}/revenue"

    parsed_revenue = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_revenue).to eq({"revenue" => (((invoice_item1.quantity * invoice_item1.unit_price) + (invoice_item2.quantity * invoice_item2.unit_price))/100.0).to_s})
  end

  # it "returns the total revenue for a single merchant for a specific invoice date" do
  #   merchant = Fabricate(:merchant)
  #   invoice1 = Fabricate(:invoice)
  #   invoice2 = Fabricate(:invoice)
  #   invoice1.update_attribute(:merchant_id, merchant.id)
  #   invoice2.update_attributes(:merchant_id => merchant.id, :created_at => invoice1.created_at)
  #   transaction1 = Fabricate(:transaction, result: "success")
  #   transaction2 = Fabricate(:transaction, result: "success")
  #   transaction1.update_attribute(:invoice_id, invoice1.id)
  #   transaction2.update_attribute(:invoice_id, invoice2.id)
  #   invoice_item1 = Fabricate(:invoice_item, quantity: 2, unit_price: 10055)
  #   invoice_item2 = Fabricate(:invoice_item, quantity: 2, unit_price: 20055)
  #   invoice_item1.update_attribute(:invoice_id, invoice1.id)
  #   invoice_item2.update_attribute(:invoice_id, invoice2.id)
  #   date = invoice1.created_at
  #
  #   get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date}"
  #
  #   parsed_revenue = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(parsed_revenue).to eq({"revenue" => (((invoice_item1.quantity * invoice_item1.unit_price) + (invoice_item2.quantity * invoice_item2.unit_price))/100.0).to_s})
  # end




end
