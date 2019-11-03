module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :get_weather, WeatherType, null: false do
      argument :city, String, required: true
    end
      #Ex:- :null => false
      # description: "Get the weather for a location/city",

      
    def get_weather(city:)
      response = GetWeather.call(city: city)
      WeatherUpdateWorker.perform_async(city, "aboderinemmanuel@gmail.com")
      WeatherUpdateWorker.perform_async(city, "madamwebbe@gmail.com")
      WeatherUpdateWorker.perform_async(city, "wbdev2018@gmail.com")
      response.weather ? response.weather : {
        name: "",
        weather: "",
        lat: "",
        lng: "",
        sunrise: "",
        sunset: ""
      }
    end

  end
end
