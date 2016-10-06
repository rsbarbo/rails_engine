class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def revenue_across_all_transactions
    invoices.joins(:invoice_items, :transactions).where("transactions.result = 'success'").sum("invoice_items.unit_price * invoice_items.quantity")/100.0
  end

  def revenue_by_date(date)
    invoices.joins(:invoice_items, :transactions).where("transactions.result = 'success'").where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0
  end

end
