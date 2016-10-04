require 'rails_helper'

describe "invoice_items actions" do
  it "returns the item associated with an invoice_item" do
    item = Fabricate(:item)
    invoice_item = Fabricate(:invoice_item, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    expect(response).to be_success

    invoice_item_parse = JSON.parse(response.body)

    expect(invoice_item_parse['name']).to eq(item.name)
    expect(invoice_item_parse['id']).to eq(1)
  end
end
