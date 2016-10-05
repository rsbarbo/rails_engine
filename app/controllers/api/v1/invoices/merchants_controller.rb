class Api::V1::Invoices::MerchantsController < ApplicationController
  def index
    @merchant = Invoice.find(params[:id]).merchant
    render json: @merchant
  end

  def show
  end


end
