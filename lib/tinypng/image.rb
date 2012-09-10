require 'tempfile'

require 'tinypng/client'

module TinyPNG
  class Image
    def initialize params={}
      @params = params
    end

    def input
      @params['input']
    end

    def output
      @params['output']
    end

    def to_file
      Tempfile.new(['tinypng', '.png']).tap do |file|
        file.write TinyPNG::Client.get(output['url'])
        file.rewind
      end
    end
  end
end
