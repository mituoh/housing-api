# Housing::API

Daiwa house housing api controller for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'housing-api', github: 'mituoh/housing-api'
```

You should require this gem like;

```ruby
require 'housing'
```

## Usage

```ruby
# You must create API Client at first.
housing = Housing::API.new(
  api_ip: '<your simulator ip address and port>'
)

# AirConditioner
ac = housing.air_conditioner

ac.off!
puts ac.status  #=> OFF
ac.on!
puts ac.status  #=> ON

ac.set_temperature 24
puts ac.get_temperature #=> 24

puts ac.indoor_temperature #=> 18

# LED Light
light = housing.light
light.on!
puts light.status #=> ON
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mituoh/housing-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
