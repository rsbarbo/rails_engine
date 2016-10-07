class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def revenue_across_all_transactions
    invoices.joins(:invoice_items, :transactions).where("transactions.result = 'success'").sum("invoice_items.unit_price * invoice_items.quantity")/100.0
  end

  def revenue_by_date(date)
    invoices.joins(:invoice_items, :transactions).where("transactions.result = 'success'").where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")/100.0
  end

  def self.top_merchants_by_number_of_items_sold(quantity)
    # Merchant.joins(:invoice_items).group("invoice_items.quantity").count --> the key is the quantity, the value is the number of invoice items which had that quantity of an item

    # Item.joins(:merchant, :invoice_items, :transactions).where("transactions.result = 'success'").group("merchants.id").distinct.count

    # Merchant.joins(invoices: [:transactions, :invoice_items]).group('id')
    #
    # Merchant.joins(:invoices, :invoice_items, :transactions).group("merchants.id")

    # joins(:invoice_items, :transactions).where("transactions.result = 'success'").group("merchants.id").sum("invoice_items.quantity")

    joins(:invoice_items, :transactions).where("transactions.result = 'success'").limit(quantity).group("merchants.id").sum("invoice_items.quantity")
  end

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
                  count(:transactions).keys.first
                  )
  end
end
