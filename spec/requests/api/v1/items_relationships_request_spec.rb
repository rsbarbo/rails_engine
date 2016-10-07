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

  it "returns the associated item" do
    invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    parsed_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_item["id"]).to eq(invoice_item.item_id)
  end
end
