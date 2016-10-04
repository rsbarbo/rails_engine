require 'rails_helper'

describe "invoice actions" do
  it "display a list of all invoices records" do
    invoices = 3.times { Fabricate(:invoice) }
    get "/api/v1/invoices.json"
    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice.count).to eq(3)
  end

  it "display specific invoice" do
    invoice = Fabricate(:invoice)
    get "/api/v1/invoices/#{invoice.id}.json"
    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice["status"]).to eq(invoice.status)
  end

  it "finds a single invoice by single parameters" do
    invoice = Fabricate(:invoice)

    get "/api/v1/invoices/find?status=#{invoice.status}"

    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice["id"]).to eq(invoice.id)
    expect(parse_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(parse_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(parse_invoice["status"]).to eq(invoice.status)
  end

  it "finds a multiple invoices by single parameters" do
    invoice_1 = Fabricate(:invoice, status: "approved")
    invoice_2 = Fabricate(:invoice, status: "approved")
    invoice_3 = Fabricate(:invoice, status: "approved")

    get "/api/v1/invoices/find_all?status=approved"

    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice.count).to eq(3)
  end
end
