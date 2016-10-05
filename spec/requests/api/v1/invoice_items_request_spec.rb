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
    Fabricate(:invoice_item, id: 1, unit_price: 81)
    Fabricate(:invoice_item, id: 2)
    Fabricate(:invoice_item, id: 3)

    get "/api/v1/invoice_items/1"

    parse_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice_items["unit_price"]).to eq("0.81")
  end

  it "it returns an existent random invoice-item when given random path" do
    Fabricate(:invoice_item, unit_price: 81)
    Fabricate(:invoice_item, unit_price: 82)
    Fabricate(:invoice_item, unit_price: 83)

    get "/api/v1/invoice_items/random"

    parse_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice_items.count).to eq(1)
  end
end
