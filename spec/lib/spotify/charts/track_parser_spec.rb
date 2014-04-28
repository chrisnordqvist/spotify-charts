require 'spec_helper.rb'

module Spotify
  module Charts
    describe TrackParser do
      subject { TrackParser.new('example') }

      it 'stores the attributes' do
        expect(subject.attributes).to eq('example')
      end

      describe '#track' do
        subject { TrackParser.new(attributes).track }

        let(:attributes) {
          {
            'date' => '2013-12-15',
            'country' => 'global',
            'track_url' => 'https://play.spotify.com/track/7DyuZtvlGT0z5Xz8peiLN7',
            'track_name' => 'I See Fire',
            'artist_name' => 'Howard Shore',
            'artist_url' => 'https://play.spotify.com/artist/6eUKZXaKkcviH0Ku9w2n3V',
            'album_name' => 'The Hobbit: The Desolation of Smaug (Original Motion Picture Soundtrack)',
            'album_url' => 'https://play.spotify.com/album/5kqgALc3cz9P3VclmSmHfr',
            'artwork_url' => 'http://o.scdn.co/300/be7d523ea35aeb10f561712420d3429f0ec68eec',
            'num_streams' => 515608,
          }
        }

        it 'creates a track from JSON data' do
          expect(subject).to be_a(Track)
        end

        it 'transforms the date' do
          expect(subject.date).to be_a(Date)
          expect(subject.date).to eq(Date.parse('2013-12-15'))
        end

        it 'transforms the country' do
          expect(subject.country).to be_a(String)
          expect(subject.country).to eq('global')
        end

        it 'transforms the track url' do
          expect(subject.track_url).to be_a(URI)
          expect(subject.track_url).to eq(URI('https://play.spotify.com/track/7DyuZtvlGT0z5Xz8peiLN7'))
        end

        it 'transforms the track name' do
          expect(subject.track_name).to be_a(String)
          expect(subject.track_name).to eq('I See Fire')
        end

        it 'transforms the artist name' do
          expect(subject.artist_name).to be_a(String)
          expect(subject.artist_name).to eq('Howard Shore')
        end

        it 'transforms the artist url' do
          expect(subject.artist_url).to be_a(URI)
          expect(subject.artist_url).to eq(URI('https://play.spotify.com/artist/6eUKZXaKkcviH0Ku9w2n3V'))
        end

        it 'transforms the album name' do
          expect(subject.album_name).to be_a(String)
          expect(subject.album_name).to eq('The Hobbit: The Desolation of Smaug (Original Motion Picture Soundtrack)')
        end

        it 'transforms the album url' do
          expect(subject.album_url).to be_a(URI)
          expect(subject.album_url).to eq(URI('https://play.spotify.com/album/5kqgALc3cz9P3VclmSmHfr'))
        end

        it 'transforms the artwork url' do
          expect(subject.artwork_url).to be_a(URI)
          expect(subject.artwork_url).to eq(URI('http://o.scdn.co/300/be7d523ea35aeb10f561712420d3429f0ec68eec'))
        end

        it 'transforms the num_streams' do
          expect(subject.num_streams).to be_a(Integer)
          expect(subject.num_streams).to eq(515608)
        end
      end
    end
  end
end
