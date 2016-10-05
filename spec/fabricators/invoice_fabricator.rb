Fabricator(:invoice) do
  customer
  merchant
  status { Faker::Hacker.adjective }

  items(count: 3)
end
