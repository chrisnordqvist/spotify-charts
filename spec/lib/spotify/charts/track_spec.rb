require 'uri'

require 'spec_helper.rb'

module Spotify
  module Charts
    describe Track do
      subject {
        Track.new.tap do |t|
          t.date = Date.parse('2013-12-15')
          t.country = 'global'
          t.track_url = URI('https://play.spotify.com/track/7DyuZtvlGT0z5Xz8peiLN7')
          t.track_name = 'I See Fire'
          t.artist_name = 'Howard Shore'
          t.artist_url = URI('https://play.spotify.com/artist/6eUKZXaKkcviH0Ku9w2n3V')
          t.album_name = 'The Hobbit: The Desolation of Smaug (Original Motion Picture Soundtrack)'
          t.album_url = URI('https://play.spotify.com/album/5kqgALc3cz9P3VclmSmHfr')
          t.artwork_url = URI('http://o.scdn.co/300/be7d523ea35aeb10f561712420d3429f0ec68eec')
          t.num_streams = 515608
        end
      }

      it 'initializes the date' do
        expect(subject.date).to eq(Date.parse('2013-12-15'))
      end

      it 'initializes the country' do
        expect(subject.country).to eq('global')
      end

      it 'initializes the track url' do
        expect(subject.track_url).to eq(URI('https://play.spotify.com/track/7DyuZtvlGT0z5Xz8peiLN7'))
      end

      it 'initializes the track name' do
        expect(subject.track_name).to eq('I See Fire')
      end

      it 'initializes the artist name' do
        expect(subject.artist_name).to eq('Howard Shore')
      end

      it 'initializes the artist url' do
        expect(subject.artist_url).to eq(URI('https://play.spotify.com/artist/6eUKZXaKkcviH0Ku9w2n3V'))
      end

      it 'initializes the album name' do
        expect(subject.album_name).to eq('The Hobbit: The Desolation of Smaug (Original Motion Picture Soundtrack)')
      end

      it 'initializes the album url' do
        expect(subject.album_url).to eq(URI('https://play.spotify.com/album/5kqgALc3cz9P3VclmSmHfr'))
      end

      it 'initializes the artwork url' do
        expect(subject.artwork_url).to eq(URI('http://o.scdn.co/300/be7d523ea35aeb10f561712420d3429f0ec68eec'))
      end

      it 'initializes the number of streams' do
        expect(subject.num_streams).to eq(515608)
      end
    end
  end
end
