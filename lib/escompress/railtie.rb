module Escompress
  class Railtie < Rails::Railtie
    initializer "escompress_railtie.configure_rails_initialization" do
      Escompress.esbuild_executable = Rails.root.join("node_modules/esbuild/bin/esbuild")
    end
  end
end
