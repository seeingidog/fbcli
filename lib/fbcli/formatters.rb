require "awesome_print"
require "json"

module FBCLI
  module Formatters
    def data(data)
      if $json
        puts data.to_json
      else
        ap data
      end
    
    end
  end
end

