require 'rails_helper'

describe "merchant record endpoints" do
  it "returns a list of all merchant records" do
    3.times { Fabricate(:merchant) }
    get "/api/v1/merchants.json"
    parsed_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_merchants.count).to eq(3)
  end

  it "returns a specific merchant" do
    merchant = Fabricate(:merchant)
    get "/api/v1/merchants/#{merchant.id}.json"
    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchant["name"]).to eq(merchant.name)
  end

  it "returns a single merchant by a single parameter, case-insensitive" do
    merchant1 = Fabricate(:merchant, name: "Amazon", created_at: "2012-03-25 14:53:59 UTC")
    Fabricate(:merchant, name: "Overstock", created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?name=Amazon"

    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchant["id"]).to eq(merchant1.id)
    expect(parsed_merchant["name"]).to eq(merchant1.name)

    get "/api/v1/merchants/find?name=amazon"

    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchant["id"]).to eq(merchant1.id)
    expect(parsed_merchant["name"]).to eq(merchant1.name)
  end

  it "returns multiple merchants by a single parameter, case-insensitive" do
    Fabricate(:merchant, name: "Amazon")
    Fabricate(:merchant, name: "Amazon")

    get "/api/v1/merchants/find_all?name=Amazon"

    parsed_merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchants.count).to eq(2)

    get "/api/v1/merchants/find_all?name=amazon"

    parsed_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_merchants.count).to eq(2)
  end

  it "returns a single random merchant" do
    Fabricate(:merchant, name: "Amazon")
    Fabricate(:merchant, name: "Overstock")
    Fabricate(:merchant, name: "Everlane")

    get "/api/v1/merchants/random.json"
    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchant.count).to eq(1)
  end
end
