class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def find_customers_with_pending_invoices
    customers.joins("INNER JOIN transactions ON transactions.invoice_id=invoices.id").where(transactions: { result: "failed" }).distinct
  end

  def find_favorite_customer
    customer_finder
  end

  private
  def customer_finder
    Customer.find(customers.joins("INNER JOIN transactions ON transactions.invoice_id=invoices.id").
             where(transactions: { result: "success" }).
             group('id').
             order("count_transactions  DESC").
             limit(1).
             count(:transactions).keys.first)
  end
end
