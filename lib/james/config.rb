require 'yaml'
require 'ostruct'
require 'hashie'

module James
  class Config
    attr_reader :path, :settings

    class << self
      def load(path)
        @settings = new(path).settings
      end
      def settings
        @settings
      end
    end

    def initialize(path)
      @path = path
      test_config_file!
      parse_file
    end

    def test_config_file!
      raise "Config file #{path} can not be found!" unless exists?
    end

    def exists?
      File.file?(path)
    end

    def parse_file
      @settings = Hashie::Mash.load(path)
    end
  end
end
