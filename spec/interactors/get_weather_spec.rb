require 'rails_helper'

RSpec.describe GetWeather, type: :interactor do

  describe '.call' do
    context "when called with a valid city" do

      interactor = GetWeather.call(city: "London")
      it "succeeds" do
        expect(interactor).to be_a_success
      end
      it "returns the name of the city amongst other" do
        expect(interactor.weather.name).to eq("London")
      end
    end
    context "when called with an invalid city" do

      interactor = GetWeather.call(city: "graphql")
      it "succeeds" do
        expect(interactor).to be_a_failure
      end
      it "returns the name of the city amongst other" do
        expect(interactor.weather).to eq(nil)
      end
    end
  end

end
