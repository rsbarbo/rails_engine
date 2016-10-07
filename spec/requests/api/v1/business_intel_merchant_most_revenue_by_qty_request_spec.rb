require 'rails_helper'

describe "The most revenue for items" do
  it "give back the top number of merchants by revenue" do
    group_size_one = 1
    group_size_two = 7

    total_revenue_one = get "/api/v1/merchants/most_revenue?quantity=#{group_size_one}"
    total_revenue_two = get "/api/v1/merchants/most_revenue?quantity=#{group_size_two}"

    expect(total_revenue_one.size).to eq(group_size_one)
    expect(total_revenue_two.size).to eq(group_size_two)

    [total_revenue_one, total_revenue_two].each do |total|
      expect(total.first['id']).to eq(14)
      expect(total.first['name']).to eq("Dicki-Bednar")
    end

    expect(total_revenue_two).to have_attribute(53)                          
    expect(total_revenue_two).to have_attribute("Rath, Gleason and Spencer") 
  end
end
