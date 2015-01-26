# Alive State

[![Gem Version](https://badge.fury.io/rb/alive_state.png)](https://rubygems.org/gems/alive_state) [![Build Status](https://travis-ci.org/ogom/alive_state.png?branch=master)](https://travis-ci.org/ogom/alive_state)

Alive Application State on Rails.

## Installation

Add this line to your application's Gemfile:

```
gem 'alive_state'
```

And then execute:

```
$ bundle
```

## Usage

Returns the current alive application state:

```
GET /status
```

Response in the format of json:

```
{
    "state": "green",
    "observed_at": "2014-03-21T12:34:56.789",
    "version": "2.0.0 as40321",
    "application": {
        "active_record": true
    }
}
```

[Browse the documentation.](http://ogom.github.io/alive_state/docs)

## License

* MIT
