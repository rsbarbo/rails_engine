Fabricator(:invoice_item) do
  item #id needs foreign key
  invoice #id needs foreign key
  quantity #needs faker
  unit_price #needs to be decimal
end
