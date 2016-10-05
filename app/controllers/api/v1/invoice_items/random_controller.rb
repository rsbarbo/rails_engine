class Api::V1::InvoicesItems::RandomController < Api::V1::BaseController
  def show
    @invoice_item = random(InvoiceItem)
    render json: @invoice_item
  end
end
