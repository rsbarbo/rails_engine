class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    top_merchants = Merchant.top_merchants_by_number_of_items_sold(params["quantity"].to_i)
    render json: top_merchants
  end

end
