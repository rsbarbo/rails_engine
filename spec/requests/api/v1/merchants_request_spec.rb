require 'rails_helper'

describe "merchant record endpoints" do
  it "returns a list of all merchant records" do
    merchants = 3.times { Fabricate(:merchant) }
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
    merchant1 = Fabricate(:merchant, name: "Amazon")
    merchant2 = Fabricate(:merchant, name: "Overstock")

    get "/api/v1/merchants/find?name=Amazon"

    parsed_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_merchant["id"]).to eq(merchant1.id)
    expect(parsed_merchant["name"]).to eq(merchant1.name)

    #maybe make a separate test?
    get "/api/v1/merchants/find?name=amazon"

    parsed_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_merchant["id"]).to eq(merchant1.id)
    expect(parsed_merchant["name"]).to eq(merchant1.name)
  end

  it "returns multiple merchants by a single parameter, case-insensitive" do
    #note that creating merchant1 and merchant2 this way is a hypothetical for testing purposes only. In reality there would only be one merchant object with the name "Amazon"
    merchant1 = Fabricate(:merchant, name: "Amazon")
    merchant2 = Fabricate(:merchant, name: "Amazon")

    get "/api/v1/merchants/find_all?name=Amazon"

    parsed_merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchants.count).to eq(2)

    #maybe make a separate test?
    get "/api/v1/merchants/find_all?name=amazon"

    parsed_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_merchants.count).to eq(2)
  end

  it "returns a single random merchant" do
    merchant1 = Fabricate(:merchant, name: "Amazon")
    merchant2 = Fabricate(:merchant, name: "Overstock")
    merchant3 = Fabricate(:merchant, name: "Everlane")

    get "/api/v1/merchants/random.json"

    parsed_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_merchant.count).to eq(1)
  end
end
