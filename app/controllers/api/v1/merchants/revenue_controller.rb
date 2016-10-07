class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    @total_revenue_for_spec_date = Merchant.find_total_revenue_for_spec_date(params[:date])
    render json: @total_revenue_for_spec_date, serializer: MerchantRevenuesSerializer
  end
end
