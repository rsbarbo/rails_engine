class Api::V1::Merchants::RandomController < Api::V1::BaseController
  
  def show
    @merchant = random(Merchant)
    render json: @merchant
  end
end
