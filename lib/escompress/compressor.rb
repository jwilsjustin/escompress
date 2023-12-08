require "open3"

module Escompress
  class Compressor
    def initialize(loader:)
      @loader = loader
    end

    def call(input)
      compress(input[:data])
    end

    private

    def compress(input)
      cmd = "#{Escompress.esbuild_executable} --loader=#{@loader} --minify"
      output, err, status = Open3.capture3(cmd, stdin_data: input)

      if status.success?
        output
      else
        puts "Escompress::Compressor error: #{err} status: #{status}"
        input
      end
    end
  end
end
