class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if params.keys.include?("name")
      render json: Merchant.find_by("lower(#{checkparams}) = ?", params[checkparams].downcase)
    else
      render json:
      Merchant.limit(1).order("RANDOM()")
    end
  end

  def index
    render json: Merchant.where("lower(#{checkparams}) = ?", params[checkparams].downcase)
  end

  private

  def checkparams
    params.keys.first
  end


end
