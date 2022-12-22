require_relative "escompress/compressor"
require_relative "escompress/version"
require "escompress/railtie" if defined?(Rails::Railtie)
require "pathname"

module Escompress
  class Error < StandardError; end

  DEFAULT_LOCATION = "/usr/local/bin/esbuild"

  def self.esbuild_executable=(path)
    @esbuild_executable = Pathname.new(path)
  end

  def self.esbuild_executable
    @esbuild_executable ||= Pathname.new(DEFAULT_LOCATION)
  end
end
