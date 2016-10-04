require 'rails_helper'

describe "invoice_items actions" do
  it "returns a list of all invoice items" do
    3.times { Fabricate(:invoice_item) }

    get "/api/v1/invoice_items.json"

    parse_invoice_items = JSON.parse(response.body)

    expect(parse_invoice_items.count).to eq(3)

  end
end
