class Api::V1::Items::RandomController < Api::V1::BaseController
  def show
    @item = random(Item)
    render json: @item
  end
end
