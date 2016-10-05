class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :cents_to_dollar, :item_id, :invoice_id

  def cents_to_dollar
    "#{'%.2f' % (object.unit_price/100.0)}"
  end
end
