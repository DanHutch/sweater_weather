require 'rails_helper'

RSpec.describe 'POST /api/v1/favorites' do

  before(:each) do
    @user = User.create(email: "whatever@example.com", password: "password")
  end

  it 'adds a location to user favorites with a valid API key' do

    location = "Denver,CO"

    parameters = "?location=#{location}&api_key=#{@user.api_key}"

    post "/api/v1/favorites#{parameters}"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:location)
    expect(results[:data][:attributes][:location]).to be_a String

  end

  it 'should not create a favorite if API key is invalid' do
    location = "Denver,CO"

    parameters = "?location=#{location}&api_key=invalidkey"

    post "/api/v1/favorites#{parameters}"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Unauthorized")
  end

  it 'should not create a duplicate favorite entry if location is already favorited' do
    @user.favorites.create(location: "denver,co")
    expect(@user.favorites.count).to eq(1)
    location = "Denver,CO"

    parameters = "?location=#{location}&api_key=#{@user.api_key}"

    post "/api/v1/favorites#{parameters}"

      expect(response).to be_successful
    expect(response.status).to eq(201)

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:location)
    expect(results[:data][:attributes][:location]).to be_a String

    expect(@user.favorites.count).to eq(1)
  end

end