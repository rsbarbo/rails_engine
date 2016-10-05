class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    @invoices = Invoice.find(params[:id]).transactions
    render json: @invoices
  end

  def show
  end

  private
  def check_params
    params.permit(:id,
                  :customer_id,
                  :merchant_id,
                  :status,
                  :created_at,
                  :updated_at)
  end
end
