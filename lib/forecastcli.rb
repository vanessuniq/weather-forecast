module Weather
  class ForecastCli
    include RubyFiglet
    APP_ID = ENV['API_KEY']
    $prompt = TTY::Prompt.new 
    def start
        self.welcome
        self.instructions
    end

    def welcome
      
        puts Figlet.new('WEATHER-FORECAST').to_s.colorize(:red)
        puts ''
        puts ''
        puts 'Welcome to your forecast!'.colorize(:blue)
        puts ''
        puts 'This is your personalized weather assistant that allows you
        to get daily weather information by zipcode.'
        line_break
        puts ''
        puts 'Instructions'.colorize(:red)
        puts ''
        puts 'Follow instruction bellow'
        puts 'Enter zipcode to get weather detail'
        puts "Type 'exit' to quit".colorize(:blue)
        self.line_break
        puts ''
    end

    def instructions
        puts 'Enter your five digit zipcode to get started or "exit" to quit:'.colorize(:blue)
        zipcode = gets.chomp.downcase
        #check for vald zip code: all digits string and length = 5
        while zipcode != 'exit'
          if zipcode[/[0-9]+/] == zipcode && zipcode.length == 5
            system('cls') || system('clear')
            Weather::ForecastApi.fetch(zipcode)
            puts "This is the 24 HRS forecast for #{Weather::Forecast.all.first.location}:".colorize(:blue)
            puts ''
            Weather::Forecast.day_display
            line_break
            puts ''
            @options = %w(Exit Check-Another-Area Next-Day-Forecast Next-2-Days-Forecast Next-3-Days-Forecast Next-4-Days-Forecast)
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
        system('cls') || system('clear')
        goodbye
    end

    def additional_options
      menu
      system('cls') || system('clear')
      case @selection
      when 'Next-Day-Forecast' 
        @@counter = 1
        specific_request
        additional_options
        
      when 'Next-2-Days-Forecast'
        @@counter = 2
        specific_request
        additional_options
      when 'Next-3-Days-Forecast'
        @@counter = 3
        specific_request
        additional_options
      when 'Next-4-Days-Forecast'
        @@counter = 4
        specific_request
        additional_options
      when 'Check-Another-Area'
        Weather::Forecast.erase
        system('cls') || system('clear')
        instructions

      else
        Weather::Forecast.erase
        system('cls') || system('clear')
          goodbye
          exit 
      end  

    end

    def menu
      @selection = $prompt.select("What would you like to do next?".colorize(:green), @options)
    end

    def line_break
        puts '============================================================================================================='.colorize(:white)
    end

    def goodbye
      puts 'Thanks "for" visiting!'.colorize(:blue)
      puts 'Enjoy the weather until next time :)'.colorize(:blue)
    end

    def specific_request
      if Weather::Forecast.all.empty?
        begin
          raise WeatherError
        rescue WeatherError => exception
          puts exception.message
        end
        @options = %w(Exit Check-Another-Area)
        additional_options
      else  
        @@counter.times do
        Weather::Forecast.day_display unless Weather::Forecast.all.empty?
        @options.pop
        end

        puts 'You have now viewed the maximum five days forecast.'.colorize(:red) if @options.size == 2
      end
      line_break
    end

    class Error < StandardError
      def message
        puts 'Invalid Input'.colorize(:red)
        puts ''
        puts 'Please try again!'.colorize(:green)
      end
    end

    class WeatherError < StandardError
      def message
        puts 'No more Forecast available'.colorize(:red)
        puts ''
        puts 'Make another Selection!'.colorize(:green)
      end
    end
  
  end
  
  
end
