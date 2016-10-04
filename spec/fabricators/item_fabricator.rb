Fabricator(:item) do
  merchant
  name { Faker::Name.name }
  description { Faker::Lorem.sentence }
  unit_price 199
end
