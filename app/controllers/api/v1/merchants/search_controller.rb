class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if merchant_params.empty?
      render json:
      Merchant.limit(1).order("RANDOM()")
    elsif merchant_params
      render json: Merchant.find_by("lower(#{merchant_params.keys.first}) = ?", params[merchant_params.keys.first].downcase)
    end
  end

  def index
    render json: Merchant.where("lower(#{merchant_params.keys.first}) = ?", params[merchant_params.keys.first].downcase)
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
