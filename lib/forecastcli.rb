require "forecast/version"

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
            #retrieve day_1 method from forecast.rb
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
        
    end

    def additional_options
      puts 'For additional forecast, make a selection bellow and press enter:'
      # construct a table to make a selection with tty-prompt
      if option_1
        puts Weather::Forecast.new.day_2
        additional_options
      elsif option_2
        puts Weather::Forecast.new.day_2
        puts Weather::Forecast.new.day_3
        additional_options
      elsif option_3
        puts Weather::Forecast.new.day_2
        puts Weather::Forecast.new.day_3
        puts Weather::Forecast.new.day_4
        additional_options
      elsif option_4
        puts Weather::Forecast.new.day_2
        puts Weather::Forecast.new.day_3
        puts Weather::Forecast.new.day_4
        puts Weather::Forecast.new.day_5
        additional_options
      elsif option_5
        Weather::Forecast.erase
        system('cls') || system('clear')
        instructions
      else
        Weather::Forecast.erase
        puts 'Thanks for visiting!'
        puts 'Enjoy the weather until next time :)'
        exit 
      end
    end

    def line_break
        puts '=========================================================================================='
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
