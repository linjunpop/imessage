# imessage

Command line tool to send iMessage.

[![Build Status](https://travis-ci.org/linjunpop/imessage.png?branch=master)](https://travis-ci.org/linjunpop/imessage)
[![Gem Version](https://badge.fury.io/rb/imessage.png)](http://badge.fury.io/rb/imessage)
[![Code Climate](https://codeclimate.com/github/linjunpop/imessage.png)](https://codeclimate.com/github/linjunpop/imessage)


## Installation

Add this line to your application's Gemfile:

    gem 'imessage'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imessage

## Usage

```shell
Usage: imessage [options]

Specific options:
    -t, --text [TEXT]                The TEXT to deliver
    -a, --attachment [ATTACHMENT]    Add an attachment
    -c, --contacts x,y,z             Deliver message to these CONTACTS

Common options:
    -h, --help                       Prints this help
        --version                    Show version
```

## Example

```
$ imessage --text "hello" --contacts "foo@example.com" --attachment 'bar.png'
```

## [Changelog](CHANGELOG.md)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

