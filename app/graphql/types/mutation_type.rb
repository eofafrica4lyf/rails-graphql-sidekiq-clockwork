module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    field :subscribe_for_updates, String, null: false do
      argument :email, String, required: true
      argument :city, String, required: true
    end

    def subscribe_for_updates(email:, city:)
      response = AddSubcription.call(email: email, city: city)

      if response.subscription_made
        SendWeatherUpdate.call(email: email, city: city)
        return "Added successfully"
      else
        return "Error! Subscription could not be made"
      end
    end

    field :remove_subscriptions, String, null: false do
      argument :email, String, required: true
      argument :city, String, required: true
    end

    def remove_subscriptions(email:, city: )
      response = RemoveSubscription.call(email: email, city: city)
      response.subscription_removed ? "Removed successfully" : "Error!"
    end
  end
end
