require 'housing/api/version'
require 'housing/helper'
require 'housing/air_conditioner'
require 'housing/light'
require 'housing/door_lock'
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
  end
end
