class Api::V1::Items::MostRevenueController < ApplicationController
  def show
    @items = Item.items_with_most_revenue(params[:quantity])
    render json: @items
  end
end
