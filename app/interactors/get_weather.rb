class GetWeather
  include Interactor

  def call
    # check that city is among the list
    response = ValidateCity.call(city: context.city)
    # fail if city is nil
    if response.city_available == nil
      context.fail!
    end

    response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{context.city}&APPID=48c84385b6a0f798c787a61ec4005a85&units=metric")
    # puts response.body, response.code, response.message, response.headers.inspect
    #wih = weather_info_holder 

    response = JSON.parse(response.body)

    wih = response["list"][-1]

    prepared_weather_statement = "Weather: #{wih['weather'][0]['main']}, Temperature: #{wih['main']['temp']}C, Humidity: #{wih['main']['humidity']}%"
    sunrise = Time.at(response['city']['sunset']).strftime("%B %e, %Y at %I:%M %p")
    sunset = Time.at(response['city']['sunrise']).strftime("%B %e, %Y at %I:%M %p")

    context.weather = OpenStruct.new(
      name: response['city']['name'],
      weather: prepared_weather_statement,
      lat: response['city']['coord']['lat'],
      lng: response['city']['coord']['lon'],
      sunrise: sunrise,
      sunset: sunset
    )
  end
end
