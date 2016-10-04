class Api::V1::Transactions::SearchController < ApplicationController
  def show
    if transaction_params.empty?
      render json:
      Transaction.limit(1).order("RANDOM()")
    elsif transaction_params && numbers_in_params?
      render json: Transaction.find_by(transaction_params)
    else
      render json: Transaction.find_by("lower(#{transaction_params.keys.first}) = ?", params[transaction_params.keys.first].downcase)
    end
  end

  def index
    if numbers_in_params?
      render json: Transaction.where(transaction_params)
    else
      render json: Transaction.where("lower(#{transaction_params.keys.first}) = ?", params[transaction_params.keys.first].downcase)
    end
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end

  def numbers_in_params?
    params[transaction_params.keys.first].to_i > 0
  end

end
