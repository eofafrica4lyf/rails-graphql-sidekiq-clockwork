module Types
  class WeatherType < Types::BaseObject
    field :name, String, null: false,
      description: "A test output for now"
    field :weather, String, null: true,
      description: "A test output for now"
    field :lat, String, null: false,
      description: "A test output for now"
    field :lng, String, null: false,
      description: "A test output for now"
    field :sunrise, String, null: false,
      description: "A test output for now"
    field :sunset, String, null: false,
      description: "A test output for now"
  end
end


