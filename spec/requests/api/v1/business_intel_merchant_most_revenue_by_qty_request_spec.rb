require 'rails_helper'

describe "The most revenue for items" do
  it "give back the top number of merchants by revenue" do
    group_size_one = 1
    group_size_two = 7

    total_revenue_one = get "/api/v1/merchants/most_revenue?quantity=#{group_size_one}"
    total_revenue_two = get "/api/v1/merchants/most_revenue?quantity=#{group_size_two}"

    expect(response).to be_success
  end
end
