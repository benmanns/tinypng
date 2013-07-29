require 'httparty'

require 'tinypng/image'
require 'tinypng/exception'

module TinyPNG
  class Client
    include HTTParty
    base_uri 'http://tinypng.org/api'

    def initialize api_key=ENV['TINY_PNG_KEY']
      @basic_auth = { username: 'api', password: api_key } if api_key
    end

    def shrink image
      begin
        response = self.class.post('/shrink', body: image, basic_auth: @basic_auth).parsed_response
      rescue => e
        raise Exception.new("Network error: #{e}")
      end

      if response['code']
        raise Exception.new("#{response['code']}: #{response['message']}")
      else
        Image.new(response)
      end
    end
  end
end
