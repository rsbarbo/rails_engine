class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    render json: InvoiceItem.where(check_params)
  end

  def show
    render json: InvoiceItem.find_by(check_params)
  end

  private
  def check_params
    clean_params = params.permit(:id,
                                 :quantity,
                                 :unit_price,
                                 :item_id,
                                 :invoice_id,
                                 :created_at,
                                 :updated_at)

    clean_params_checker(clean_params)
  end
end
