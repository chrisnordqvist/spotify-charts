# Spotify::Charts

[![Gem Version](https://badge.fury.io/rb/spotify-charts.png)](http://badge.fury.io/rb/spotify-charts)
[![Code Climate](https://codeclimate.com/github/murphyslaw/spotify-charts.png)](https://codeclimate.com/github/murphyslaw/spotify-charts)
[![Dependency Status](https://gemnasium.com/murphyslaw/spotify-charts.png)](https://gemnasium.com/murphyslaw/spotify-charts)
[![Build Status](https://travis-ci.org/murphyslaw/spotify-charts.png)](https://travis-ci.org/murphyslaw/spotify-charts)

A Ruby wrapper for the public [Spotify Charts API](http://charts.spotify.com/) to retrieve the
top 50 shared or streamed tracks on Spotify.

## Installation

Add this line to your application's Gemfile:

    gem 'spotify-charts'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spotify-charts

## Usage

Retrieve **Available Countries**

```
Spotify::Charts.available_countries
```

Retrieve **Available Dates** for a given country. The country needs to be in the format returned
by `available_countries` method.

```
Spotify::Charts.available_dates(country)
```

Retrieve **Most Shared** tracks for a given country and date. The country and date need to be in the
format returned by `available_countries` and `availabe_dates` methods.

```
Spotify::Charts.most_shared(country, date)
```

Retrieve **Most Streamed** tracks for a given country and date. The country and date need to be in
the format returned by `available_countries` and `availabe_dates` methods.

```
Spotify::Charts.most_streamed(country, date)
```

## Testing

The default `rake` task is configured to run all tests.

```
rake
```

`ZenTest` is used for continous testing. Run `autotest` to start.
`simplecov` is used for test coverage. Run `open coverage/index.html` to open the results.

## Contributing

1. Fork it (https://github.com/murphyslaw/spotify-charts/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
