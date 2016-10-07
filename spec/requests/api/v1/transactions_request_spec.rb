require 'rails_helper'

describe "transaction record endpoints" do
  it "returns a list of all transaction records" do
    3.times { Fabricate(:transaction) }

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
    expect(parsed_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
  end

  it "returns a single transaction by a single parameter, case-insensitive" do
    transaction1 = Fabricate(:transaction, credit_card_number: 12345, result: "success")
    Fabricate(:transaction, credit_card_number: 67890, result: "failed")

    get "/api/v1/transactions/find?credit_card_number=12345"

    parsed_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_transaction["id"]).to eq(transaction1.id)
    expect(parsed_transaction["credit_card_number"]).to eq(transaction1.credit_card_number)

    get "/api/v1/transactions/find?result=Success"

    JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_transaction["id"]).to eq(transaction1.id)
    expect(parsed_transaction["credit_card_number"]).to eq(transaction1.credit_card_number)
  end

  it "returns multiple transactions by a single parameter, case-insensitive" do
    Fabricate(:transaction, credit_card_number: 12345, result: "success")
    Fabricate(:transaction, credit_card_number: 12345, result: "failed")

    get "/api/v1/transactions/find_all?credit_card_number=12345"
    parsed_transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transactions.count).to eq(2)

    get "/api/v1/transactions/find_all?result=Failed"

    parsed_transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transactions.count).to eq(1)
  end

  it "returns a single random transaction" do
    Fabricate(:transaction, credit_card_number: 12345, result: "success")
    Fabricate(:transaction, credit_card_number: 12345, result: "failed")

    get "/api/v1/transactions/random.json"
    parsed_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_transaction.count).to eq(1)
  end
end
