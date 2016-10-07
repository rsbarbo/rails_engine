class Api::V1::Items::AssociatedMerchantController < ApplicationController
  def show
    item = Item.find(params[:id])
    render json: item.merchant
  end
end
