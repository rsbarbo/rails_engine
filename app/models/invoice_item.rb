class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  before_save :cents_to_dollar

  def cents_to_dollar
    byebug
    # self.price_unit =
  end
end
