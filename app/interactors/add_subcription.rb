class AddSubcription
  include Interactor

  def call
    # TODO
    # check that city is among the list
    response = ValidateCity.call(city: context.city)
    # fail if city is nil
    context.fail! if !response.city_available

    check_records = Subscription.find_by(email: context.email, city: context.city)
    context.fail! if check_records

    context.subscription_made = Subscription.create!(email: context.email, city: context.city)
  end
end

# NOTES
# check the shebang(!) usecases
# read up about Ruby truthy values