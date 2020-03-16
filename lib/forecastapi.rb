require 'pry'

module Weather
    class ForecastApi

    APP_ID = '1f792f9fe2181c904b1196d07a34cd8f'

    # fetch forecast info from OpenWeather API
        def self.fetch(zipcode)
            url = "http://api.openweathermap.org/data/2.5/forecast?zip=#{zipcode}&units=imperial&appid=#{APP_ID}"
        
            response = HTTParty.get(url) 
            data = JSON.parse(response.body, symbolize_names: true)
            data
        
        end

    end


end