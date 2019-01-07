require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "relationships" do
    it {should have_many(:favorites)}
  end

  describe "instance methods" do
    describe "#add_fav" do
      it "should create a new favorite for that user" do
        user = User.create(email: "fake@email.com", password: "password")
        expect(user.favorites.count).to eq(0)
        user.add_fav({location: "denver,co"})
        expect(user.favorites.count).to eq(1)
        expect(user.favorites.last.location).to eq("denver,co")
      end
    end
  end

end