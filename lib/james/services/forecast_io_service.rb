require 'forecast_io'

module James
  module Services
    class ForecastIoService
      def initialize(config =  James::Config.load('ressources/james_file.yml').forecast_io)
        @config = config
        ForecastIO.api_key = config.api_key
      end

      def get_forecast
        ForecastIO.forecast(37.8267, -122.423)
      end
    end
  end
end
