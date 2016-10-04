class Api::V1::Invoices::SearchController < ApplicationController
  def index
    render json: Invoice.where(check_params)
  end

  def show
    render json: Invoice.find_by(check_params)
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
