class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    merchants = Merchant.all
    top_merchants = merchants.top_merchants_by_number_of_items_sold
    # if params["date"]
    #   revenue = {:revenue => merchants.revenue_by_date(params["date"]).to_s}
    # else
    #   revenue = {:revenue => merchant.revenue_across_all_transactions.to_s}
    # end
    render json: top_merchants
  end

end
