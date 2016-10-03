require 'rails_helper'

describe "invoice actions" do
  it "sends a list of all invoices records" do
    invoices = create_list(:invoice, 3)
    get "/api/v1/invoices.json"
    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice.count).to eq(3)
  end
end
