class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    @invoices = Invoice.find(params[:id]).invoice_items
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
