class Api::V1::Invoices::RandomController < Api::V1::BaseController
  def show
    @invoice = random(Invoice)
    render json: @invoice
  end
end
