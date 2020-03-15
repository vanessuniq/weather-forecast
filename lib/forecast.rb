require 'pry'

module Weather

    class Forecast
        Data = Struct.new(:date, :temp, :humidity, :description)
        @@all = []

        def location (zipcode)
            city = ForecastApi.fetch(zipcode)
            city[:city][:name]
        end

        def hourly_forecast(zipcode)
            hourly_data = ForecastApi.fetch(zipcode)
            @@all = hourly_data[:list].map do |data|
                Data.new(
                    Time.at(data[:dt]).strftime('%a %b-%d %H:%M'),
                    data[:main][:temp],
                    data[:main][:humidity],
                    data[:weather].first[:description]
                )
            end
        end

        def day_display
            #self.class.erase
            #hourly_forecast(zipcode)
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