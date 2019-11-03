class WeatherUpdateWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(city, email)
        # sleep 10
        SendWeatherUpdate.call(email: email, city: city)
        puts "Sidekiq worker ran now"
    end
end