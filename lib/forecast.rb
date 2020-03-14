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
            hourly_data[:list].each do |data|
                Data.new(
                    Time.at(data[:dt]).strftime('%a %b-%d %H:%M'),
                    data[:main][:temp],
                    data[:main][:humidity],
                    data[:weather].first[:description]
                )
                @@all << self
            end
        end

        def day_1
            first_24 = []
            8.times do
                first_24 << @@all.shift
            end
        end

        def day_2
            next_day = []
            8.times do
                next_day << @@all.shift
            end
        end

        def day_3
            next_2day = []
            8.times do
                next_2day << @@all.shift
            end
        end

        def day_4
            next_3day = []
            8.times do
                next_3day << @@all.shift
            end
        end

        def day_5
            next_4day = []
            8.times do
                next_4day << @@all.shift
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