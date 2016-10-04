class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def cents_to_dollar
    byebug
    # self.price_unit =
  end
end
