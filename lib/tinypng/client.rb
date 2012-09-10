require 'httparty'

require 'tinypng/image'
require 'tinypng/exception'

module TinyPNG
  class Client
    include HTTParty
    base_uri 'http://tinypng.org/api'

    def shrink image
      begin
        response = self.class.post('/shrink', body: image).parsed_response
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
