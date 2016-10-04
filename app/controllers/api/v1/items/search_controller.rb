class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: Item.where(check_params)
  end

  def show
  end

  private
  def check_params
    params.permit(:id,
                  :name,
                  :description,
                  :merchant_id,
                  :created_at,
                  :updated_at,
                  :unit_price)
  end
end
