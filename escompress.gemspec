# frozen_string_literal: true

require_relative "lib/escompress/version"

Gem::Specification.new do |spec|
  spec.name = "escompress"
  spec.version = Escompress::VERSION
  spec.authors = ["Justin Wilson"]
  spec.email = ["justin@jwils.co"]

  spec.summary = "Use esbuild to compress your Rails CSS"
  spec.description = "Use esbuild to compress your Rails CSS"
  spec.homepage = "https://github.com/jwilsjustin/escompress"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jwilsjustin/escompress"
  spec.metadata["changelog_uri"] = "https://github.com/jwilsjustin/escompress/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "railties"
end
