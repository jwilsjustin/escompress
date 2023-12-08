# Escompress

Use esbuild to compress your Rails CSS (or JS if you want).

## Why?

You might find yourself with a Rails app that uses sass-rails (and sassc) gems. You may be stuck with these gems for legacy reasons. But the sassc gem can't handle newer CSS syntaxes. You may see this error:

```
SassC::SyntaxError: Error: Function rgb is missing argument $green
```

More info: https://github.com/tailwindlabs/tailwindcss/discussions/6738

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add escompress

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install escompress

## Usage

Make sure you have `esbuild` in your package.json file. If you are using Rails, escompress will look in your node_modules folder for the esbuild executable. If not using Rails, the gem will assume the executable is located at `/usr/local/bin/esbuild` on the underlying machine.

```ruby
# in application.rb

# You can specify the location of your esbuild executable.
# Escompress.esbuild_executable = Rails.root.join("some/other/path/esbuild")

module MyApp
  class Application < Rails::Application
    # ... other code
    config.assets.css_compressor = :escompress
    # config.assets.js_compressor = :escompress
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwilsjustin/escompress. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to be decent human beings.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
