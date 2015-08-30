# imessage

Command line tool to send iMessage.

[![Build Status](https://travis-ci.org/linjunpop/imessage.png?branch=master)](https://travis-ci.org/linjunpop/imessage)
[![Gem Version](https://badge.fury.io/rb/imessage.png)](http://badge.fury.io/rb/imessage)
[![Code Climate](https://codeclimate.com/github/linjunpop/imessage.png)](https://codeclimate.com/github/linjunpop/imessage)


## Installation

### As a Homebrew(http://brew.sh) package

    $ brew install imessage-ruby

### As a gem

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/linjunpop/imessage.

