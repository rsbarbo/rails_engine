class Api::V1::Merchants::RevenuesController < ApplicationController
  def index
    @total_revenue_for_spec_date = Merchant.find_total_revenue_for_spec_date(params[:date])
    render json: @total_revenue_for_spec_date
  end
end
