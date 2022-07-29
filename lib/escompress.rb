require_relative "escompress/compressor"
require_relative "escompress/version"
require "escompress/railtie" if defined?(Rails::Railtie)

module Escompress
  class Error < StandardError; end

  @@esbuild_executable = "/usr/local/bin/esbuild"

  def self.esbuild_executable=(path)
    @@esbuild_executable = path
  end

  def self.esbuild_executable
    @@esbuild_executable
  end
end
