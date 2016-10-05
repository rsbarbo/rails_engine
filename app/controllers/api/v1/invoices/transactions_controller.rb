class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    @invoices = Invoice.find(params[:id]).transactions
    render json: @invoices
  end

  def show
  end

end
