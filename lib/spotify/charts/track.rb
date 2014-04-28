module Spotify
  module Charts
    class Track
      attr_accessor :date, :country, :track_url, :track_name, :artist_name, :artist_url,
        :album_name, :album_url, :artwork_url, :num_streams

      def ==(other)
        other.class == self.class && other.state == state
      end
      alias_method :eql?, :==

      protected

      def state
        [date, country, track_url, track_name, artist_name, album_name, artwork_url, num_streams]
      end
    end
  end
end
