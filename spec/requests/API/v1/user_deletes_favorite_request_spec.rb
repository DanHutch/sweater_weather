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
    expect(response.status).to eq(204)
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