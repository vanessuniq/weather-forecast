require "weather/forecast/version"

module Weather
  class ForecastCli

    def start
        welcome
        Instructions
    end

    def welcome
        puts << INFO
        Welcome to your forecast!

        This is your personalized weather assistant that allows you
        to get daily weather information by zipcode.
        INFO
        line_break
        puts ''
        puts 'Instructions'
        puts ''
        puts 'Follow instruction bellow'
        puts 'Enter zipcode to get weather detail'
        puts "Type 'exit' to quit"
        line_break
        puts ''
    end

    def Instructions
        puts 'Enter your five digit zipcode to get started:'
        zipcode = gets.chomp
        ForecastApi.fetch(zipcode)
    end

    def line_break
        puts '==================================='
    end

    class Error < StandardError; end
  end
  
end
