class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    @merchant = Merchant.find(params[:id])
    @revenue = {:revenue => revenue_across_all_transactions(@merchant).to_s}
    render json: @revenue
  end

  private

  def revenue_across_all_transactions(merchant)
    merchant.invoice_items.pluck("quantity * unit_price").reduce(:+)
  end

end
