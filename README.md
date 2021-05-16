# KeyPay API

This is an unofficial Ruby gem client for accessing the [KeyPay](https://www.keypay.com.au) API, specifically developed for use in the Australian version of the API.

Documentation for the KeyPay API can be found at https://api.keypay.com.au/australia/reference

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'keypay_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install keypay_api

## Usage

First, initialise a client using your API key

```ruby
client = KeyPayAPI::Client.new("KEYPAY_API_TOKEN")
```

or, you can set an environment variable `ENV['KEYPAY_API_TOKEN']`, in whih case initialise as follows

```ruby
client = KeyPayAPI::Client.new
```

Then call the relevant method

```ruby
client.list_businesses
```

### List of available methods
```ruby
client.list_businesses
client.list_employees
client.show_employee(businessId, employeeId)
client.create_employee(businessId, options)
client.onboard_employee(businessId, options)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mattman/keypay_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mattman/keypay_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KeypayApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mattman/keypay_api/blob/master/CODE_OF_CONDUCT.md).
