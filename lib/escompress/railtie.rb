require "rails/railtie"

module Escompress
  class Railtie < ::Rails::Railtie
    initializer "escompress_railtie.configure_rails_initialization", group: :all do
      Escompress.esbuild_executable = Rails.root.join("node_modules/esbuild/bin/esbuild")

      # Adapted from https://github.com/ahorek/terser-ruby/blob/46a23ba/lib/terser/railtie.rb
      if config.respond_to?(:assets) # Ensure asset pipeline is there
        config.assets.configure do |env|
          # A processor is expected to respond to call() and it accepts a hash of file contents.
          # It is expected to return a hash that includes a :data key.
          # https://github.com/rails/sprockets/blob/main/guides/extending_sprockets.md#compressors
          # https://github.com/rails/sprockets/blob/main/guides/extending_sprockets.md#extension-interface
          env.register_compressor "text/css", :escompress, Escompress::Compressor.new(loader: :css)
          env.register_compressor "application/javascript", :escompress, Escompress::Compressor.new(loader: :js)
        end
      end
    end
  end
end
