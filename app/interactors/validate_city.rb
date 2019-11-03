class ValidateCity
  include Interactor

  def call
    # TODO
    context.city_available = City.find_by(name: context.city)
  end
end
