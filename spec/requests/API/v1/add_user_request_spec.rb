require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'creates a user and returns an API key' do
    parameters = "?email=whatever@example.com&password=password&password_confirmation=password"

    expect(User.count).to eq(0)

    post "/api/v1/users#{parameters}"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:attributes]).to have_key(:api_key)
    expect(results[:data][:attributes][:api_key]).to be_a String
    expect(User.count).to eq(1)
  end

  it 'should not create a user if passwords do not match' do
    parameters = "?email=whatever@example.com&password=password&password_confirmation=wrong"

    expect(User.count).to eq(0)

    post "/api/v1/users#{parameters}"

    expect(response.status).to eq(422)
    expect(response.body).to eq("Something went wrong!")
    expect(User.count).to eq(0)
  end

  it 'should not create a user if password_confirmation is blank' do
    expect(User.count).to eq(0)

    parameters = "?email=whatever@example.com&password=password"

    post "/api/v1/users#{parameters}"

    expect(response.status).to eq(422)
    expect(response.body).to eq("Something went wrong!")
    expect(User.count).to eq(0)
  end

  it 'should not create a user if the email is already in use' do
    user = User.create!(email: "whatever@example.com", password: "newpassword")
    parameters = "?email=whatever@example.com&password=password&password_confirmation=password"

    expect(User.count).to eq(1)

    post "/api/v1/users#{parameters}"

    expect(response.status).to eq(422)
    expect(response.body).to eq("Something went wrong!")
    expect(User.count).to eq(1)
  end
end