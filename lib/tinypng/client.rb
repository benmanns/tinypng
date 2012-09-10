require 'httparty'

require 'tinypng/image'

module TinyPNG
  class Client
    include HTTParty
    base_uri 'http://tinypng.org/api'

    def shrink image
      Image.new(self.class.post('/shrink', body: image).parsed_response)
    end
  end
end
