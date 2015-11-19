module Housing
  class Shutter
    include Housing::Helper

    attr_accessor :url

    COMMON_PARAM = '?deviceid=lite.switch_2_1'

    def initialize(attrs = {})
      url = attrs[:url]
      @api_url = url + COMMON_PARAM
    end

    def status
      req = @api_url + '&type=get&key=operationStatus'
      res = Net::HTTP.get URI(req)
      body = Oga.parse_xml res
      code = body.xpath('//data/value').map(&:text).first
      return 'OPEN' if code == 'OFF'
      return 'CLOSE' if code == 'ON'
    end

    def close!
      req = @api_url + '&type=set&key=operationStatus&value=ON'
      Net::HTTP.get URI(req)
    end

    def open!
      req = @api_url + '&type=set&key=operationStatus&value=OFF'
      Net::HTTP.get URI(req)
    end
  end
end
