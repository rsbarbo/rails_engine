require 'rails_helper'

describe "items relationships endpoints" do
  it "returns the associated invoice items" do
    item = Fabricate(:item)
    invoice_item = Fabricate(:invoice_item)
    invoice_item2 = Fabricate(:invoice_item)
    invoice_item.update_attribute(:item_id, item.id)
    invoice_item2.update_attribute(:item_id, item.id)


    get "/api/v1/items/#{item.id}/invoice_items"
    parsed_invoice_items = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_invoice_items.count).to eq(2)
  end

  it "returns the associated merchant" do
    merchant = Fabricate(:merchant)
    item = Fabricate(:item)
    item.update_attribute(:merchant_id, merchant.id)

    get "/api/v1/items/#{item.id}/merchant"
    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchant["id"]).to eq(merchant.id)
  end
end
