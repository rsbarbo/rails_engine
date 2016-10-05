require 'rails_helper'

describe "invoice_items actions" do
  it "returns a list of all invoice items" do
    3.times { Fabricate(:invoice_item) }
    get "/api/v1/invoice_items.json"
    parse_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice_items.count).to eq(3)
  end

  it "returns a single invoice items" do
    item_1 = Fabricate(:invoice_item, id: 1, unit_price: 81)
    Fabricate(:invoice_item, id: 2)
    Fabricate(:invoice_item, id: 3)

    get "/api/v1/invoice_items/1"

    parse_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice_items["cents_to_dollar"]).to eq("0.81")
  end
end
