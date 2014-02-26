require "haml"

module YawlRails
  class Engine < ::Rails::Engine
    isolate_namespace YawlRails

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.template_engine :haml
    end

    initializer "yawl_rails.append_migrations" do |app|
      unless app.root.to_s.match root.to_s
        app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
      end
    end

    initializer "yawl_rails.setup_yawl" do |app|
      require "yawl/rails"
    end
  end
end
