require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe SendWeatherUpdate, type: :mailer do
  describe '.call' do
    let(:mail){WeatherMailer.with(subscription: {
      email: "aboderinemmanuel@gmail.com", 
      city: "Lagos"
      },
      weather_condition: Hash.new({
        "name": "London",
        "weather": "Weather: Clouds, Temperature: 4.31C, Humidity: 73%",
        "lat": "51.5073",
        "lng": "-0.1277",
        "sunrise": "November  6, 2019 at 04:26 PM",
        "sunset": "November  6, 2019 at 07:02 AM"
      })
    ).send_weather_updates.deliver_now}
    context "when mailer is called" do
      it "renders the headers" do
        # ActiveJob::Base.queue_adapter = :test

        # expect(WeatherMailer.send_weather_updates)
        expect(mail.subject).to eq("Your Daily Weather Updates")
        expect(mail.to).to eq(["aboderinemmanuel@gmail.com"])
        expect(mail.from).to eq(["emmanuela@buycoins.africa"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Here is your weather for today.")
      end
    end
  end
end
