class Api::V1::Transactions::RandomController < Api::V1::BaseController
  
  def show
    @transaction = random(Transaction)
    render json: @transaction
  end
end
