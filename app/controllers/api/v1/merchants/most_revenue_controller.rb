class Api::V1::Merchants::MostRevenueController < ApplicationController
  def show
    @merchants = Merchant.items_with_most_revenue(params[:quantity])
    render json: @merchants
  end
end
