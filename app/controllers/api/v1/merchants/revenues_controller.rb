class Api::V1::Merchants::RevenuesController < ApplicationController
  def index
    merchant = Merchant.find(params[:id])
    if params["date"]
      revenue = {:revenue => merchant.revenue_by_date(params["date"]).to_s}
    else
      revenue = {:revenue => merchant.revenue_across_all_transactions.to_s}
    end
    render json: revenue
  end
end
