Fabricator(:item) do
  name { Faker::Name.name }
  description { Faker::Lorem.sentence }
  unit_price 199
  merchant
end
