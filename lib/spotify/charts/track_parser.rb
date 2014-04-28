require 'date'
require 'uri'

module Spotify
  module Charts
    class TrackParser
      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes
      end

      def track
        Track.new.tap do |t|
          t.date = Date.parse(attributes['date'])
          t.country = attributes['country']
          t.track_url = URI(attributes['track_url'])
          t.track_name = attributes['track_name']
          t.artist_name = attributes['artist_name']
          t.artist_url = URI(attributes['artist_url'])
          t.album_name = attributes['album_name']
          t.album_url = URI(attributes['album_url'])
          t.artwork_url = URI(attributes['artwork_url'])
          t.num_streams = attributes['num_streams']
        end
      end
    end
  end
end
