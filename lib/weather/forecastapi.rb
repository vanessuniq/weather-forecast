require 'pry'
require 'open-uri'

class Weather::ForecastApi
    attr_accessor :zipcode
    attr_reader :api_key
    api_key = ENV['API_KEY']

    def initialize(api_key)
        @api_key = api_key
    end

    # fetch forecast info from OpenWeather API
    def self.fetch(zipcode)
        url = "http://api.openweathermap.org/data/2.5/forecast?zip=#{zipcode}&unit=imperial&mode=xml&appid=#{@api_key}"
        doc = Nokogiri::XML(open(url))
    end


end