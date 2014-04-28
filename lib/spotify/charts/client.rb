require 'uri'
require 'net/http'
require 'json'

module Spotify
  module Charts
    class Client
      def self.base_uri
        'http://charts.spotify.com/api/charts'
      end

      def request(endpoint)
        uri = URI(self.class.base_uri + endpoint)
        response = Net::HTTP.get(uri)
        JSON.parse(response)
      end
    end
  end
end
