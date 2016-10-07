Fabricator(:transaction) do
  credit_card_number { Faker::Number.number(10) }
  credit_card_expiration_date 012020
  result { Faker::Hacker.adjective }
  invoice
end
