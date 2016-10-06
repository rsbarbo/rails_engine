class Api::V1::Customers::RandomController < Api::V1::BaseController
  def show
    @customer = random(Customer)
    render json: @customer
  end
end
