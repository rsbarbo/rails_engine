class ItemSerializer < ActiveModel::Serializer
  attributes :description, :id, :merchant_id, :name
  attribute :cents_to_dollar, key: :unit_price

  def cents_to_dollar
    "#{'%.2f' % (object.unit_price/100.0)}"
  end
end
