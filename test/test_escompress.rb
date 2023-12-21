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

  def test_css_compressor
    Escompress.esbuild_executable = Pathname.new("/usr/local/bin/esbuild")
    compressor = Escompress::Compressor.new(loader: :css)
    output = compressor.call(data: "a { color: #ff0000 }")
    assert_equal output, "a{color:red}\n"
  end

  def test_js_compressor
    Escompress.esbuild_executable = Pathname.new("/usr/local/bin/esbuild")
    compressor = Escompress::Compressor.new(loader: :js)
    output = compressor.call(data: "const hello = (name) => { console.log(name) }")
    assert_equal output, "const hello=o=>{console.log(o)};\n"
  end
end
