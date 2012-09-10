require 'httparty'

module TinyPNG
  class Client
    include HTTParty
    base_uri 'http://tinypng.org/api'

    def shrink image
      self.class.post('/shrink', body: image).parsed_response
    end
  end
end
