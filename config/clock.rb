require "clockwork"
require "active_support/time"
require_relative "../config/boot"
require_relative "../config/environment"

module Clockwork

    every(1.day, 'weather_update_worker.worker', :at => '06:30'){
        Subscription.all.each do |s|
            WeatherUpdateWorker.perform_async(s.city, s.email)
        end
    }
end