class Api::V1::InvoiceItems::AssociatedInvoiceController < ApplicationController
  def show
    invoice_item = InvoiceItem.find(params[:id])
    render json: invoice_item.invoice
  end
end
