class RemoveSubscription
  include Interactor

  def call
    # TODO
    check_records = Subscription.find_by(email: context.email, city: context.city)
    # check_records = Subscription.destroy_all
    if !check_records
      context.fail!
    end

    context.subscription_removed = check_records.destroy
    context.subscription_removed
  end
end
