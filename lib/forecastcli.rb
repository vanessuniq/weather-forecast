require "forecast/version"
require 'tty-prompt'

module Weather
  class ForecastCli
    APP_ID = '1f792f9fe2181c904b1196d07a34cd8f'

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
        puts 'Enter your five digit zipcode to get started or "exit" to quit:'
        zipcode = gets.chomp.downcase
        #check for vald zip code: all digits string and length = 5
        while zipcode != 'exit'
          if zipcode[/[0-9]+/] == zipcode && zipcode.length == 5
            system('cls') || system('clear')
            location = Weather::Forecast.new.location(zipcode)
            puts "This is the 24 HRS forecast for #{location}:"
            puts ''
            Weather::Forecast.new.hourly_forecast(zipcode)
            Weather::Forecast.new.day_display
            line_break
            puts ''
            additional_options
          else
            begin
              raise Error
            rescue Error => exception
              puts exception.message
            end
            instructions
          end
        end
        goodbye
    end

    def additional_options
      puts 'For additional forecast, use ↑/↓ or ←/→ then press enter to make a selection:'
      # design a menu to make a selection with tty-prompt
      
      
        if answer == 'Next-Day-Forecast' 
          Weather::Forecast.new.day_display
          additional_options
        elsif answer == 'Next-2-Days-Forecast'
          2.times do
            Weather::Forecast.new.day_display
          end
        additional_options
        elsif answer == 'Next-3-Days-Forecast'
          3.times do
            Weather::Forecast.new.day_display
          end
          additional_options
        elsif answer == 'Next-4-Days-Forecast'
          4.times do
            Weather::Forecast.new.day_display
          end
          additional_options
        elsif answer == 'Check-Another-Area'
          Weather::Forecast.erase
          system('cls') || system('clear')
          instructions
        elsif answer == 'Exit'
          Weather::Forecast.erase
          goodbye
          exit 
        end

    end

    def menu
      options = ['Next-Day-Forecast', 'Next-2-Days-Forecast', 'Next-3-Days-Forecast', 'Next-4-Days-Forecast', 'Check-Another-Area', 'Exit']
      options
    end

    def line_break
        puts '=========================================================================================='
    end

    def goodbye
      puts 'Thanks "for" visiting!'
      puts 'Enjoy the weather until next time :)'
    end

    class Error < StandardError
      def message
        puts 'Invalid Input'
        puts ''
        puts 'Please try again!'
      end
    end
  
  end
  
  
end
