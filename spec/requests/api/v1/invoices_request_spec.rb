require 'rails_helper'

describe "invoice actions" do
  it "display a list of all invoices records" do
    3.times { Fabricate(:invoice) }
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
    Fabricate(:invoice, status: "shipped")
    Fabricate(:invoice, status: "shipped")
    Fabricate(:invoice, status: "something else")

    get "/api/v1/invoices/find_all?status=shipped"

    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice.count).to eq(2)
  end

  it "it returns an existent random invoice when given random path" do
    Fabricate(:invoice, status: "approved")
    Fabricate(:invoice, status: "pending")
    Fabricate(:invoice, status: "paid")

    get "/api/v1/invoices/random"

    parse_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_invoice.count).to eq(1)
  end

end
