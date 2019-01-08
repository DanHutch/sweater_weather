require 'rails_helper'

RSpec.describe 'GET /api/v1/favorites' do

  before(:each) do
    @user = User.create(email: "whatever@example.com", password: "password")
    @fav_1 = @user.favorites.create(location: "denver,co")
    @fav_2 = @user.favorites.create(location: "atlanta,ga")
  end

  it 'lists user favorites with forecasts' do

    parameters = "?api_key=#{@user.api_key}"

    get "/api/v1/favorites#{parameters}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results).to have_key(:data)
    expect(results[:data]).to be_a Array
    results[:data].each do |result|
      expect(result).to have_key(:attributes)
      expect(result[:attributes]).to have_key(:location)
      expect(result[:attributes]).to have_key(:current_weather)
      expect(result[:attributes][:current_weather]).to have_key(:summary)
      expect(result[:attributes][:current_weather]).to have_key(:feels_like)
      expect(result[:attributes][:current_weather]).to have_key(:hourly_summary)
      expect(result[:attributes][:current_weather]).to have_key(:daily_summary)
    end
  end

  it 'should not list favorites if API key is invalid' do

    parameters = "?api_key=invalidkey"

    get "/api/v1/favorites#{parameters}"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Unauthorized")
  end

end