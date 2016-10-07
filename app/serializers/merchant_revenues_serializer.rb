class MerchantRevenuesSerializer < ActiveModel::Serializer
  attribute :cents_to_dollar, key: :total_revenue

  def cents_to_dollar
    "#{'%.2f' % (object/100.0)}"
  end
end
