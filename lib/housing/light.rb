module Housing
  class Light
    include Housing::Helper

    attr_accessor :url

    COMMON_PARAM = '?deviceid=lite.ledLight_1_1'

    def initialize(attrs = {})
      url = attrs[:url]
      @api_url = url + COMMON_PARAM
    end

    def status
      req = @api_url + '&type=codeget&key=80'
      res = Net::HTTP.get URI(req)
      body = Oga.parse_xml res
      code = body.xpath('//data/value').map(&:text).first
      return 'ON' if code == '30'
      return 'OFF' if code == '31'
    end

    def on!
      req = @api_url + '&type=codeset&key=80&value=30'
      Net::HTTP.get URI(req)
    end

    def off!
      req = @api_url + '&type=codeset&key=80&value=31'
      Net::HTTP.get URI(req)
    end
  end
end
