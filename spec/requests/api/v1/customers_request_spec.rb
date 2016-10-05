require 'rails_helper'

describe "customer record endpoints" do
  it "returns a list of all customer records" do
    customers = 3.times { Fabricate(:customer) }

    get "/api/v1/customers.json"

    parsed_customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customers.count).to eq(3)
  end

  it "returns a specific customer" do
    customer = Fabricate(:customer, first_name: "Chase", last_name: "Dunagan")

    get "/api/v1/customers/#{customer.id}.json"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer["first_name"]).to eq(customer.first_name)
  end

  it "returns a single customer by a single parameter, case-insensitive" do
    customer1 = Fabricate(:customer, first_name: "Chase", last_name: "Dunagan")
    customer2 = Fabricate(:customer, first_name: "Susi", last_name: "Irwin")

    get "/api/v1/customers/find?first_name=Susi"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer["id"]).to eq(customer2.id)
    expect(parsed_customer["last_name"]).to eq(customer2.last_name)

    #maybe make a separate test?
    get "/api/v1/customers/find?first_name=susi"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer["id"]).to eq(customer2.id)
    expect(parsed_customer["last_name"]).to eq(customer2.last_name)

    get "/api/v1/customers/find?id=#{customer2.id}"
    expect(response).to be_success
    # get "/api/v1/customers/find?created_at=#{customer1.created_at}"
    # parsed_customer = JSON.parse(response.body)
    # expect(response).to be_success
    # expect(parsed_customer["id"]).to eq(customer1.id)
    # expect(parsed_customer["first_name"]).to eq(customer1.name)
  end

  it "returns multiple customers by a single parameter, case-insensitive" do
    #note that creating merchant1 and merchant2 this way is a hypothetical for testing purposes only. In reality there would only be one merchant object with the name "Amazon"
    customer1 = Fabricate(:customer, first_name: "Chase", last_name: "Dunagan")
    customer2 = Fabricate(:customer, first_name: "Susi", last_name: "Dunagan")

    get "/api/v1/customers/find_all?last_name=Dunagan"
    parsed_customers = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_customers.count).to eq(2)

    #maybe make a separate test?
    get "/api/v1/customers/find_all?first_name=Chase"

    parsed_customers = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_customers.count).to eq(1)

    get "/api/v1/customers/find_all?find_all?id=#{customer2.id}"
    expect(response).to be_success
  end

  it "returns a single random customer" do
    customer1 = Fabricate(:customer, first_name: "Chase", last_name: "Dunagan")
    customer2 = Fabricate(:customer, first_name: "Susi", last_name: "Irwin")

    get "/api/v1/customers/random.json"
    parsed_customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed_customer.count).to eq(1)
  end
end
