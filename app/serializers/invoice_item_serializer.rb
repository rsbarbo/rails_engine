class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity
  attribute :cents_to_dollar, key: :unit_price

  def cents_to_dollar
    "#{'%.2f' % (object.unit_price/100.0)}"
  end
end
