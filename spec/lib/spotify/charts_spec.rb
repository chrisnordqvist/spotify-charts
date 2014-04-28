require 'net/http'

require 'spec_helper.rb'

module Spotify
  describe Charts do
    subject { Charts }

    describe '.available_countries' do
      let(:response) {
        %w(ar at au be bg ch cl co cr cz de dk ec ee es fi fr gb gr gt hk hu ie is it li lt lu lv mx
          my nl no nz pe pl pt se sg sk sv tr tw us uy global)
      }

      before do
        allow_any_instance_of(Charts::Client).to receive(:request)
          .with('/most_shared/') { response }
      end

      it 'lists available countries' do
        expect(subject.available_countries).to be_a(Enumerable)
      end

      it 'includes the "global" country' do
        expect(subject.available_countries).to include('global')
      end
    end

    describe '.available_dates' do
      let(:response) {
        %w(latest 2013-12-08 2013-12-01 2013-11-24 2013-11-17 2013-11-10 2013-11-03 2013-10-27
          2013-10-20 2013-10-13 2013-10-06 2013-09-29 2013-09-22 2013-09-15 2013-09-08 2013-09-01
          2013-08-25 2013-08-18 2013-08-11 2013-08-04 2013-07-28 2013-07-21 2013-07-14 2013-07-07
          2013-06-30 2013-06-23 2013-06-16 2013-06-09 2013-06-02 2013-05-26 2013-05-19 2013-05-12
          2013-05-05 2013-04-28)
      }

      before do
        allow_any_instance_of(Charts::Client).to receive(:request)
          .with('/most_shared/global/') { response }
      end

      it 'lists available dates' do
        expect(subject.available_dates('global')).to be_a(Enumerable)
      end

      it 'includes the "latest" date' do
        expect(subject.available_dates('global')).to include('latest')
      end
    end

    describe '.most shared' do
      subject { Charts.most_shared('global', 'latest') }

      let(:response) {
        {
          'tracks' => [
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
               'num_streams' => 515608
            },
            {
               'date' => '2013-12-15',
               'country' => 'global',
               'track_url' => 'https://play.spotify.com/track/44GgIVlmRsD1qMWONOWOS3',
               'track_name' => 'Waiting Game',
               'artist_name' => 'BANKS',
               'artist_url' => 'https://play.spotify.com/artist/2xe8IXgCTpwHE3eA9hTs4n',
               'album_name' => 'LONDON',
               'album_url' => 'https://play.spotify.com/album/4xG1FKMIQPGYRujVBtMAqm',
               'artwork_url' => 'http://o.scdn.co/300/4027ebaa3c0ff4161020cb37a546f25929249166',
               'num_streams' => 182325
            }
          ]
        }
      }

      let(:tracks) {
        response['tracks'].inject([]) do |tracks, item|
          tracks << Charts::TrackParser.new(item).track
        end
      }

      before do
        allow_any_instance_of(Charts::Client).to receive(:request)
          .with('/most_shared/global/latest') { response }
      end

      it 'returns a list of tracks' do
        subject.each do |track|
          expect(track).to be_a(Charts::Track)
        end
      end

      it 'tracks correspond to webservice response' do
        subject.each_with_index do |track, index|
          expect(track).to eq(tracks[index])
        end
      end
    end

    describe '.most streamed' do
      subject { Charts.most_streamed('global', 'latest') }

      let(:response) {
        {
          'tracks' => [
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
               'num_streams' => 515608
            },
            {
               'date' => '2013-12-15',
               'country' => 'global',
               'track_url' => 'https://play.spotify.com/track/44GgIVlmRsD1qMWONOWOS3',
               'track_name' => 'Waiting Game',
               'artist_name' => 'BANKS',
               'artist_url' => 'https://play.spotify.com/artist/2xe8IXgCTpwHE3eA9hTs4n',
               'album_name' => 'LONDON',
               'album_url' => 'https://play.spotify.com/album/4xG1FKMIQPGYRujVBtMAqm',
               'artwork_url' => 'http://o.scdn.co/300/4027ebaa3c0ff4161020cb37a546f25929249166',
               'num_streams' => 182325
            }
          ]
        }
      }

      let(:tracks) {
        response['tracks'].inject([]) do |tracks, item|
          tracks << Charts::TrackParser.new(item).track
        end
      }

      before do
        allow_any_instance_of(Charts::Client).to receive(:request)
          .with('/most_streamed/global/latest') { response }
      end

      it 'returns a list of tracks' do
        subject.each do |track|
          expect(track).to be_a(Charts::Track)
        end
      end

      it 'tracks correspond to webservice response' do
        subject.each_with_index do |track, index|
          expect(track).to eq(tracks[index])
        end
      end
    end
  end
end
