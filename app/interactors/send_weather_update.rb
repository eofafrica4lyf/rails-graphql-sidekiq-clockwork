class SendWeatherUpdate
  include Interactor

  def call
    # TODO
    response = GetWeather.call(city: context.city)
    WeatherMailer.with(subscription: {
      email: context.email, 
      city: context.city
      },
      weather_condition: response.weather
    ).send_weather_updates.deliver_now
  end
end
