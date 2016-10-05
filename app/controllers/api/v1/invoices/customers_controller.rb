class Api::V1::Invoices::CustomersController < ApplicationController
  def index
    @customer = Invoice.find(params[:id]).customer
    render json: @customer
  end

  def show
  end


end
