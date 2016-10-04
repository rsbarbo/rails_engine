require 'rails_helper'

describe "transaction record endpoints" do
  it "returns a list of all transaction records" do
    transactions = 3.times { Fabricate(:transaction) }

    get "/api/v1/transactions.json"

    parsed_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_transactions.count).to eq(3)
  end

  it "returns a specific transaction" do
    transaction = Fabricate(:transaction, credit_card_number: 12345)

    get "/api/v1/transactions/#{transaction.id}.json"

    parsed_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_transaction["credit_card_number"].to_i).to eq(transaction.credit_card_number)
  end

  it "returns a single transaction by a single parameter, case-insensitive" do
    transaction1 = Fabricate(:transaction, credit_card_number: 12345, result: "success")
    transaction2 = Fabricate(:transaction, credit_card_number: 67890, result: "failed")

    get "/api/v1/transactions/find?credit_card_number=12345"

    parsed_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_transaction["id"]).to eq(transaction1.id)
    expect(parsed_transaction["credit_card_number"]).to eq(transaction1.credit_card_number)

    #maybe make a separate test?
    get "/api/v1/transactions/find?result=Success"
    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transaction["id"]).to eq(transaction1.id)
    expect(parsed_transaction["credit_card_number"]).to eq(transaction1.credit_card_number)

    # get "/api/v1/merchants/find?created_at=2012-03-25 14:53:59 UTC"
    # parsed_merchant = JSON.parse(response.body)
    # expect(response).to be_success
    # expect(parsed_merchant["id"]).to eq(merchant1.id)
    # expect(parsed_merchant["name"]).to eq(merchant1.name)
  end

  it "returns multiple transactions by a single parameter, case-insensitive" do
    #note that creating merchant1 and merchant2 this way is a hypothetical for testing purposes only. In reality there would only be one merchant object with the name "Amazon"
    transaction1 = Fabricate(:transaction, credit_card_number: 12345, result: "success")
    transaction2 = Fabricate(:transaction, credit_card_number: 12345, result: "failed")

    get "/api/v1/transactions/find_all?credit_card_number=12345"
    parsed_transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transactions.count).to eq(2)

    #maybe make a separate test?
    get "/api/v1/transactions/find_all?result=Failed"

    parsed_transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transactions.count).to eq(1)
  end

  it "returns a single random transaction" do
    transaction1 = Fabricate(:transaction, credit_card_number: 12345, result: "success")
    transaction2 = Fabricate(:transaction, credit_card_number: 12345, result: "failed")

    get "/api/v1/transactions/random.json"
    parsed_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transaction.count).to eq(1)
  end
end
