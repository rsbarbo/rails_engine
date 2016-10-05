Fabricator(:invoice) do
  customer
  merchant
  status { Faker::Hacker.adjective }
end
