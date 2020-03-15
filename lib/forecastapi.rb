require 'pry'
require 'httparty'
require 'json'
require 'rexml/document'

module Weather
    class ForecastApi
    include REXML
    APP_ID = '1f792f9fe2181c904b1196d07a34cd8f'

    # fetch forecast info from OpenWeather API
        def self.fetch(zipcode)
            url = "http://api.openweathermap.org/data/2.5/forecast?zip=#{zipcode}&units=imperial&appid=#{APP_ID}"
        
            response = HTTParty.get(url) 
            
                if response.code == '200'
                    data = JSON.parse(response.body, symbolize_names: true)
                    data
            
                 else
                    raise response.body
                 end
        
        end

        

    end


end