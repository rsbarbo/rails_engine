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

  it "finds a single invoice" do
    invoice = Fabricate(:invoice)

    parameters = {id: invoice.id,
                  customer_id: invoice.customer_id,
                  merchant_id: invoice.merchant_id,
                  status: invoice.status,
                  created_at: invoice.created_at,
                  updated_at: invoice.updated_at
                }

    get "/api/v1/invoices/find?status=#{parameters[:status]}"

    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice["id"]).to eq(invoice.id)
    expect(parse_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(parse_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(parse_invoice["status"]).to eq(invoice.status)
  end
end
