Fabricator(:invoice_item) do
  item
  invoice
  quantity { Faker::Number.decimal(2) }
  unit_price { Faker::Commerce.price }
end
