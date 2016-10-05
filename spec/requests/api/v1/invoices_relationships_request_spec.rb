require 'rails_helper'

describe "invoices relationships endpoints" do
  it "returns a collection of associated transactions" do
    transaction = Fabricate(:transaction)
    get "/api/v1/invoices/#{transaction.invoice_id}/transactions"
    parsed_transactions = JSON.parse(response.body)




  end

  it "returns a collection of associated invoice items" do

  end

  it "returns a collection of associated items" do

  end

  it "returns the associated customer" do

  end

  it "returns the associated merchant" do

  end
end
