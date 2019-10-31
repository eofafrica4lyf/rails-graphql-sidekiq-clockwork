module Types
  class WeatherType < Types::BaseObject
    field :name, String, null: false,
      description: "A test output for now"
    field :city, String, null: false,
      description: "A test output for now"
  end
end
