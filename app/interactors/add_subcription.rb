class AddSubcription
  include Interactor

  def call
    # TODO
    # check that city is among the list
    response = ValidateCity.call(city: context.city)
    # fail if city is nil
    if response.city_available == nil
      context.fail!
    end

    check_records = Subscription.find_by(email: context.email, city: context.city)
    if check_records
      context.fail!
    end

    subscription = Subscription.new(email: context.email, city: context.city)
    puts "subscription made========================="
    puts subscription
    #Checks if record exists
    if !subscription.new_record?
      context.fail!
    end

    context.subscription_made = subscription.save
  end
end
