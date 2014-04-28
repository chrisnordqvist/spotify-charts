require 'uri'
require 'net/http'

require 'spec_helper.rb'

module Spotify
  module Charts
    describe Client do
      describe '.base_uri' do
        it 'returns the Spotify Charts API base uri' do
          expect(subject.class.base_uri).to eq('http://charts.spotify.com/api/charts')
        end
      end

      describe '#request' do
        let(:endpoint) { '/most_shared/global/latest' }

        before do
          uri = URI(subject.class.base_uri + endpoint)
          allow(Net::HTTP).to receive(:get).with(uri).once { '{"example":"json"}' }
        end

        it 'parses JSON response' do
          expect(subject.request(endpoint)).to eq({'example' => 'json'})
        end
      end
    end
  end
end
