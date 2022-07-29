# Escompress

Use esbuild to compress your Rails CSS (or JS if you want).

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add escompress

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install escompress

## Usage

```ruby
# in application.rb

# You can specify the location of your esbuild executable.
# The default location where escompress will look is /usr/local/bin/esbuild
Escompress.esbuild_executable = Rails.root.join("node_modules/esbuild/bin/esbuild")

module MyApp
  class Application < Rails::Application
    # ... other code
    config.assets.css_compressor = Escompress::Compressor.new(loader: :css)
    # config.assets.js_compressor = Escompress::Compressor.new(loader: :js)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/escompress. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/escompress/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
