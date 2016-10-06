require 'rails_helper'

describe "The most revenue for merchants" do
  it "give back the top number of merchants organized by revenue" do
    first_date = "2012-03-16 11:55:05"
    second_date = "2012-03-07 10:54:55"

    total_revenue_one = get "/api/v1/merchants/revenue?date=#{first_date}"
    total_revenue_two = get "/api/v1/merchants/revenue?date=#{second_date}"

    assert_equal ({"total_revenue" => "1518.84"}), total_revenue_one
    assert_equal ({"total_revenue" => "3004.65"}), total_revenue_two
  end
end
