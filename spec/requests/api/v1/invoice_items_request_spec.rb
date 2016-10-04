require 'rails_helper'

describe "invoice_items actions" do
  it "returns the item associated with an invoice_item" do
    item = Fabricate(:item)
    invoice_item = Fabricate(:invoice_item, item_id: item.id)

    byebug

    get '/api/v1/invoice_items/2/item'
    expect(response).to be_success

    content = JSON.parse(response.body)

    expect(content['name']).to eq("Item Qui Esse")
    expect(content['id']).to eq(1)
  end
end
