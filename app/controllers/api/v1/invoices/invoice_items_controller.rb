class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    @invoices = Invoice.find(params[:id]).invoice_items
    render json: @invoices
  end
end
