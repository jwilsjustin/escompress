require "minitest/autorun"
require "escompress"
require "pathname"

class TestEscompress < Minitest::Test
  def test_default_executable_location
    Escompress.instance_variable_set(:@esbuild_executable, nil)
    assert_equal Escompress.esbuild_executable, Pathname.new("/usr/local/bin/esbuild")
  end

  def test_configurable_executable_location
    Escompress.esbuild_executable = Pathname.new("/Users/justin/Sites/example/node_modules/esbuild/bin/esbuild")
    assert_equal Escompress.esbuild_executable, Pathname.new("/Users/justin/Sites/example/node_modules/esbuild/bin/esbuild")
  end
end
