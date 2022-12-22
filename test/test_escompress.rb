require "minitest/autorun"
require "escompress"

class TestEscompress < Minitest::Test
  def test_default_executable_location
    assert_equal Escompress.esbuild_executable, "/usr/local/bin/esbuild"
  end

  # FIXME: add this after moving away from class vars
  # def test_configurable_executable_location
  #   Escompress.esbuild_executable = "/Users/justin/Sites/example/node_modules/esbuild/bin/esbuild"
  #   assert_equal Escompress.esbuild_executable, "/Users/justin/Sites/example/node_modules/esbuild/bin/esbuild"
  # end
end
