require 'rails_helper'

describe "items actions" do
  it "display a list of all items" do
    3.times { Fabricate(:item) }
    get "/api/v1/items.json"
    parse_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_items.count).to eq(3)
  end

  it "display specific item" do
    item = Fabricate(:item)
    get "/api/v1/items/#{item.id}.json"
    parse_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_item["name"]).to eq(item.name)
  end

  it "finds a single item by single parameters" do
    item = Fabricate(:item)

    get "/api/v1/items/find?status=#{item.name}"

    parse_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_item["id"]).to eq(item.id)
    expect(parse_item["merchant_id"]).to eq(item.merchant_id)
    expect(parse_item["name"]).to eq(item.name)
  end

  it "finds a multiple items by single parameters" do
    Fabricate(:item, unit_price: 198)
    Fabricate(:item, unit_price: 199)
    Fabricate(:item, unit_price: 199)

    get "/api/v1/items/find_all?unit_price=199"

    parse_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_item.count).to eq(2)
  end

  it "it returns an existent random item when given random path" do
    Fabricate(:item, unit_price: 197)
    Fabricate(:item, unit_price: 198)
    Fabricate(:item, unit_price: 199)

    get "/api/v1/items/random"

    parse_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parse_item.count).to eq(1)
  end
end
