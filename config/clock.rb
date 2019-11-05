require "clockwork"
require "active_support/time"
require_relative "../config/boot"
require_relative "../config/environment"

module Clockwork

    every(5.minutes, 'weather_update_worker.worker'){
        Subscription.all.each do |s|
            WeatherUpdateWorker.perform_async(s.city, s.email)
        end
    }
end