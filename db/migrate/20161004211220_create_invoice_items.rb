class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps null:false
    end
  end
end
