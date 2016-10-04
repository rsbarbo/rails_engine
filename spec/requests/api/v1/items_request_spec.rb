require 'rails_helper'

describe "items actions" do
  it "display a list of all items" do
    items = 3.times { Fabricate(:item) }
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
end
