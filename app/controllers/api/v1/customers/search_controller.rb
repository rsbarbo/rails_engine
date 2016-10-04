class Api::V1::Customers::SearchController < ApplicationController
  def show
    if customer_params.empty?
      render json:
      Customer.limit(1).order("RANDOM()")
    elsif customer_params && numbers_in_params?
      render json: Customer.find_by(customer_params)
    else
      render json: Customer.find_by("lower(#{customer_params.keys.first}) = ?", params[customer_params.keys.first].downcase)
    end
  end

  def index
    if numbers_in_params?
      render json: Customer.where(customer_params)
    else
      render json: Customer.where("lower(#{customer_params.keys.first}) = ?", params[customer_params.keys.first].downcase)
    end
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

  def numbers_in_params?
    params[customer_params.keys.first].to_i > 0
  end


end
