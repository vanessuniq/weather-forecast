require "forecast/version"

module Weather
  class ForecastCli
    APP_ID = ENV['API_KEY']

    def start
        self.welcome
        self.instructions
    end

    def welcome
        puts 'Welcome to your forecast!'
        puts ''
        puts 'This is your personalized weather assistant that allows you
        to get daily weather information by zipcode.'
        line_break
        puts ''
        puts 'Instructions'
        puts ''
        puts 'Follow instruction bellow'
        puts 'Enter zipcode to get weather detail'
        puts "Type 'exit' to quit"
        self.line_break
        puts ''
    end

    def instructions
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
