require 'net/http'
require 'uri'
require 'oga'

module Housing
  class API
    attr_reader :api_ip

    HEMS = '/hemscommon/ver1.0'
    SMART_HOME = '/smart/rest/request'

    def initialize(options = {})
      @api_ip = options[:api_ip]
    end

    def air_conditioner
      url = @api_ip + SMART_HOME
      air_conditioner = Housing::AirConditioner.new(url: url)
      air_conditioner
    end

    def light
      url = @api_ip + SMART_HOME
      light = Housing::Light.new(url: url)
      light
    end

    def door_lock
      url = @api_ip + SMART_HOME
      door_lock = Housing::DoorLock.new(url: url)
      door_lock
    end

    def shutter
      url = @api_ip + SMART_HOME
      shutter = Housing::Shutter.new(url: url)
      shutter
    end

    def window
      url = @api_ip + SMART_HOME
      window = Housing::Window.new(url: url)
      window
    end
  end
end
