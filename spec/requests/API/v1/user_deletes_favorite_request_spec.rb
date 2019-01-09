require 'rails_helper'

RSpec.describe 'DELETE /api/v1/favorites' do

  before(:each) do
    @user = User.create(email: "whatever@example.com", password: "password")
    @fav_1 = @user.favorites.create(location: "denver,co")
    @fav_2 = @user.favorites.create(location: "atlanta,ga")
  end

  it 'deletes a user favorite with a valid API key' do

    location = "Denver,CO"

    parameters = "?location=#{location}&api_key=#{@user.api_key}"

    expect(@user.favorites.count).to eq(2)

    delete "/api/v1/favorites#{parameters}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:location)
    expect(results[:data][:attributes][:location]).to be_a String
    expect(results[:data][:attributes][:location]).to eq(location.downcase)

    expect(@user.favorites.count).to eq(1)
  end

  it 'should not delete a favorite if API key is invalid' do
    location = "Denver,CO"

    parameters = "?location=#{location}&api_key=invalidkey"

    expect(@user.favorites.count).to eq(2)

    delete "/api/v1/favorites#{parameters}"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Unauthorized")

    expect(@user.favorites.count).to eq(2)
  end

end