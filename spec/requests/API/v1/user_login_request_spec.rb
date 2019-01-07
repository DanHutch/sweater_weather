require 'rails_helper'

RSpec.describe 'POST /api/v1/sessions' do

  before(:each) do
    @user = User.create(email: "whatever@example.com", password: "password")
  end

  it 'validates a user and returns an API key' do

    parameters = "?email=#{@user.email}&password=#{@user.password}"

    post "/api/v1/sessions#{parameters}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:api_key)
    expect(results[:data][:attributes][:api_key]).to be_a String
    expect(results[:data][:attributes][:api_key]).to eq(@user.api_key)
  end

  it 'should not send back an API key with an invalid password' do

    invalid = "wrongpassword"
    parameters = "?email=#{@user.email}&password=#{invalid}"

    post "/api/v1/sessions#{parameters}"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Invalid")
  end

end