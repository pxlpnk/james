require 'geokit'
module James
  module Helpers
    module Geocoder
      module_function
      def latitude_longitude(place)
        Geokit::Geocoders::GoogleGeocoder.geocode(place)
      end
    end
  end
end
