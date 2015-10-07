module Housing
  class AirConditioner
    include Housing::Helper

    attr_accessor :url

    COMMON_PARAM = '?deviceid=lite.aircon_1_1'

    def initialize(attrs = {})
      url = attrs[:url]
      @api_url = url + COMMON_PARAM
    end

    def status
      req = @api_url + '&type=get&key=operationStatus'
      res = Net::HTTP.get URI(req)
      body = Oga.parse_xml res
      body.xpath('//data/value').map(&:text).first
    end

    def on!
      req = @api_url + '&type=set&key=operationStatus&value=ON'
      Net::HTTP.get URI(req)
    end

    def off!
      req = @api_url + '&type=set&key=operationStatus&value=OFF'
      Net::HTTP.get URI(req)
    end

    def get_temperature
      req = @api_url + '&type=get&key=temperature'
      res = Net::HTTP.get URI(req)
      body = Oga.parse_xml res
      body.xpath('//data/value').map(&:text).first
    end

    def set_temperature(temperature)
      req = @api_url + '&type=set&key=temperature&value=' + temperature.to_s
      Net::HTTP.get URI(req)
    end

    def indoor_temperature
      req = @api_url + '&type=get&key=indoorTemperature'
      res = Net::HTTP.get URI(req)
      body = Oga.parse_xml res
      body.xpath('//data/value').map(&:text).first
    end
  end
end
