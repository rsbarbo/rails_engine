class Api::V1::Items::MostRevenueController < ApplicationController
  def show
    #needs to run the model method before otherwise it doesnt know what is looking for.
    @items = Item.items_with_most_revenue(params[:quantity])
    render json: @items
  end
end
