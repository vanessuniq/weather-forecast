require "./lib/forecast/version.rb"

Gem::Specification.new do |spec|
  spec.name          = "weather-forecast"
  spec.version       = Weather::VERSION
  spec.authors       = ["Vanessa Fotso"]
  spec.email         = "vanessuniq@gmail.com"
  spec.files         = ["lib/weather_forecast.rb", "lib/forecast/version.rb", "lib/emoji.rb", "lib/forecast.rb", "lib/forecastapi.rb", "lib/forecastcli.rb", "lib/environment.rb"]
  spec.summary       = %q{Gem and CLI providing weather/forecast by zipcode. Weather is provided by scraping the OpenWeather website.}
  spec.homepage      = "https://rubygems.org/gems/weather-forecast"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
   if spec.respond_to?(:metadata)
     spec.metadata["allowed_push_host"] = 'https://rubygems.org'

     spec.metadata["homepage_uri"] = spec.homepage
     spec.metadata["source_code_uri"] = "https://github.com/vanessuniq/weather-forecast"
     spec.metadata["changelog_uri"] = "https://github.com/vanessuniq/weather-forecast"
   else
     raise "RubyGems 2.0 or newer is required to protect against " \
       "public gem pushes."
   end

  spec.executables << 'execute'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "dotenv", ">= 0"
  spec.add_development_dependency "colorize", ">= 0"
  spec.add_development_dependency "tty", ">= 0"
  spec.add_development_dependency "tty-prompt", ">= 0"
  spec.add_development_dependency "httparty", ">= 0"
  spec.add_development_dependency "json", ">= 0"
  spec.add_development_dependency "terminal-table", ">= 0"
  spec.add_development_dependency "ruby_figlet", ">= 0"
end
