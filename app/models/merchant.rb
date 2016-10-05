class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def find_customers_with_pending_invoices
    customers
    .joins("INNER JOIN transactions ON transactions.invoice_id=invoices.id").where(transactions: {result: "failed"}).distinct
  end
end
