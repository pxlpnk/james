require 'forecast_io'

module James
  module Services
    class ForecastIoService
      attr_reader :response

      class << self
        def berlin(days = 3)
          location = James::Helpers::Geocoder.latitude_longitude('Berlin, Germany')
          forecast_service = new()
          forecast_service.get_forecast(location.lat, location.lng)
          ap forecast_service.parse_response
          forecast_service
        end
      end

      def initialize(config =  James::Config.load('ressources/james_file.yml').forecast_io)
        @config = config
        ForecastIO.api_key = config.api_key
      end

      def get_forecast(latitude, longitude)
        @response = ForecastIO.forecast(latitude, longitude, options)
      end

      def parse_response
        {
         currently:
         {
          temperature: currently.temperature,
          apparent_temp: currently.apparentTemperature,
          windSpeed: currently.windspeed
         }
        }
      end

      def currently
        @response.currently
      end

      def options
        {params: { units: 'si' }}
      end
    end
  end
end
