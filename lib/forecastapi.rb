require 'pry'
require 'httparty'
require 'rexml/document'
module Weather
    class ForecastApi
    include REXML
    APP_ID = ENV['API_KEY']

    # fetch forecast info from OpenWeather API
        def self.fetch(zipcode = '20904')
        url = "http://api.openweathermap.org/data/2.5/forecast?zip=#{zipcode}&unit=imperial&appid=#{APP_ID}"
        response = Net::HTTP.get_response(url)
            if response.code == '200'
            doc = Document.new(File.new(response))
            puts doc
            else
            raise response.body
            end
        
        end

    end


end