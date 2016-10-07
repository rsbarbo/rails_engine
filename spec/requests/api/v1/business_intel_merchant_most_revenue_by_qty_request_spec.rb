require 'rails_helper'

describe "The most revenue for items" do
  it "give back the top number of merchants organized by revenue" do
    group_size_one = 1
    group_size_two = 8

    total_revenue_one = get "/api/v1/merchants/most_items?quantity=#{group_size_one}"
    total_revenue_two = get "/api/v1/merchants/most_items?quantity=#{group_size_two}"

    expect(total_revenue_one.size).to eq(group_size_one)
    expect(total_revenue_two.size).to eq(group_size_two)

    [total_revenue_one, total_revenue_two].each do |total|
      expect(total.first['id']).to eq(89)
      expect(total.first['name']).to eq("Kassulke, O'Hara and Quitzon")
    end

    expect(total_revenue_two).to have_attribute(58)
    expect(total_revenue_two).to have_attribute("Rogahn LLC")
  end
end
