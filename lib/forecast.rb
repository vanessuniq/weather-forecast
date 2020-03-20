require 'pry'

module Weather

    class Forecast
        @@all = []
        attr_accessor :location, :date, :temp, :humidity, :description

        def initialize (date:, temp:, humidity:, description:)
            @date = date
            @temp = temp
            @humidity = humidity
            @description = description
            save
        end

        def save
            @@all << self
        end

        def self.day_display
            forecast = []

            8.times do
                forecast << @@all.shift
            end
            
            forecast.each do |data|
                puts Terminal::Table.new(
                    rows: [
                        [data.date, "Temp: #{data.temp} F  Humidity: #{data.humidity}  Sky: #{data.description}"]
                    ],
                    style: {
                        border_i: 'X',
                        border_x: '=',
                        width: 110
                    }
                )
            end

        end

        
        def self.all 
            @@all
        end

        def self.erase
            @@all.clear
        end
    end

end