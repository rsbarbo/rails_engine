require 'rails_helper'

describe "invoices items relationships endpoints" do
  it "returns the associated invoice" do
    invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    parsed_invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_invoice["id"]).to eq(invoice_item.invoice_id)
  end

  it "returns the associated item" do
    invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    parsed_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_item["id"]).to eq(invoice_item.item_id)
  end
end
