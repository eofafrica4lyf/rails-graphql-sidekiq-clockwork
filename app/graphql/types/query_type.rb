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
      argument :city, String, required: true, prepare: ->(city, ctx){
        return city.upcase()
      }
    end
      #Ex:- :null => false
      # description: "Get the weather for a location/city",

      
    def get_weather(city:)
        {name: "city", city: city}
    end

  end
end
