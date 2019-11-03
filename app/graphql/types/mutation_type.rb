module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    field :weather_updates_subscription, String, null: false do
      argument :email, String, required: true
      argument :city, String, required: true
    end

    def weather_updates_subscription(email:, city:)
      subscription = Subscription.new
      subscription.email = email
      subscription.city = city
      result = subscription.save
      result ? "Your subscription has been successfully made" : "Error! Subscription could not be made"
    end

  end
end
