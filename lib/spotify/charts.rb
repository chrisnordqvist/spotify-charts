require 'spotify/charts/version'
require 'spotify/charts/client'
require 'spotify/charts/track'
require 'spotify/charts/track_parser'

module Spotify
  module Charts
    class << self
      def available_countries
        client.request('/most_shared/')
      end

      def available_dates(country)
        client.request("/most_shared/#{country}/")
      end

      def most_shared(country, date)
        extract_tracks("/most_shared/#{country}/#{date}")
      end

      def most_streamed(country, date)
        extract_tracks("/most_streamed/#{country}/#{date}")
      end

      private

      def client
        @client ||= Spotify::Charts::Client.new
      end

      def extract_tracks(endpoint)
        json = client.request(endpoint)['tracks']

        json.inject([]) do |tracks, item|
          tracks << TrackParser.new(item).track
        end
      end
    end
  end
end
