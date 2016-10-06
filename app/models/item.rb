class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices


  def self.items_with_most_revenue(quantity)
    joins(:invoice_items).
    group('id').
    order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").
    limit(quantity)
  end


  def self.find_total_revenue_for_spec_date
    byebug
  end
end
