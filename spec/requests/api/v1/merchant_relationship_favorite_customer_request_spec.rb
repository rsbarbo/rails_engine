require 'rails_helper'

describe "Favorite Customer" do
  it "returns favorite customer based on merchant id" do
    merchant   = Fabricate(:merchant, id: 15)
    customer   = Fabricate(:customer, id: 1, first_name: "Tom")
    customer2  = Fabricate(:customer, id: 2, first_name: "Joey")

    invoice  = Fabricate(:invoice, id: 1, customer_id: customer.id, merchant_id: merchant.id)
    invoice2  = Fabricate(:invoice, id: 2, customer_id: customer2.id, merchant_id: merchant.id)
    invoice3  = Fabricate(:invoice, id: 3, customer_id: customer2.id, merchant_id: merchant.id)

    Fabricate(:invoice_item, invoice_id: invoice.id)
    Fabricate(:transaction, invoice_id: invoice.id, result: "success")

    Fabricate(:invoice_item, invoice_id: invoice2.id)
    Fabricate(:transaction, invoice_id: invoice2.id, result: "success")

    Fabricate(:invoice_item, invoice_id: invoice3.id)
    Fabricate(:transaction, invoice_id: invoice3.id, result: "success")
  end
end
