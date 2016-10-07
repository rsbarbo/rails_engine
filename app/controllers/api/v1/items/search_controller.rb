class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: Item.where(check_params)
  end

  def show
    render json: Item.where(check_params).first
  end

  def check_params
    clean_params = params.permit(:id,
                                 :name,
                                 :description,
                                 :merchant_id,
                                 :created_at,
                                 :updated_at,
                                 :unit_price)

    clean_params_checker(clean_params)
  end
end
