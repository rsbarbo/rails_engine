require 'rails_helper'

describe "The most revenue for merchants" do
  it "give back the top number of merchants organized by revenue" do
    date = "2012-03-16 11:55:05"

    total_revenue_one = get "/api/v1/merchants/revenue?date=#{date}"

    expect(response).to be_success
  end
end
