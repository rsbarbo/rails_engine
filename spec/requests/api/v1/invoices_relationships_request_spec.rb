require 'rails_helper'

describe "invoices relationships endpoints" do
  it "returns a collection of associated transactions" do
    transaction1 = Fabricate(:transaction)
    transaction2 = Fabricate(:transaction)
    transaction2.update_attribute(:invoice_id, transaction1.invoice_id)

    get "/api/v1/invoices/#{transaction1.invoice_id}/transactions"
    parsed_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_transactions.count).to eq(2)
  end

  it "returns a collection of associated invoice items" do
    invoice_item1 = Fabricate(:invoice_item)
    invoice_item2 = Fabricate(:invoice_item)
    invoice_item2.update_attribute(:invoice_id, invoice_item1.invoice_id)

    get "/api/v1/invoices/#{invoice_item1.invoice_id}/invoice_items"
    parsed_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_items.count).to eq(2)
  end

  it "returns a collection of associated items" do
    invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoices/#{invoice_item.invoice_id}/items"
    parsed_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_items.count).to eq(1)
  end


  it "returns the associated customer" do

  end

  it "returns the associated merchant" do

  end
end
