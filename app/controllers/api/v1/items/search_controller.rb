class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: Item.where(check_params)
  end

  def show
    render json: Item.where(check_params).first
  end

  private
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

  def clean_params_checker(clean_params)
    if clean_params[:unit_price]
      return_formatted_unit_price(clean_params)
    end
    clean_params
  end

  def format_unit_price(unit_price)
    unit_price.gsub('.', '')
  end

  def return_formatted_unit_price(clean_params)
    clean_params[:unit_price] = format_unit_price(clean_params[:unit_price])
  end
end
