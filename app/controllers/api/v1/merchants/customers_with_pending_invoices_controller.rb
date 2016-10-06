class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    @customer = Merchant.find(params[:id]).find_customers_with_pending_invoices
    render json: @customer
  end
end
