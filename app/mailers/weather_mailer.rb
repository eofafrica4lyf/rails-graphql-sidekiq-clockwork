class WeatherMailer < ApplicationMailer
    default from: "emmanuela@buycoins.africa"

    def send_weather_updates
        @subscription = params[:subscription]
        @weather_condition = params[:weather_condition]
        puts @subscription
        puts @weather_condition
        mail(to: @subscription[:email], subject: "Your Daily Weather Updates")
    end
end
