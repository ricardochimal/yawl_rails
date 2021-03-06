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
        if Rails::VERSION::MAJOR >= 4
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end
    end

    initializer "yawl_rails.setup_yawl" do |app|
      require "yawl/rails"
    end

    initializer "yawl_rails.setup_pagination" do |app|
      require "yawl/pagination"
      Yawl::Config.pagination_per_page ||= Yawl::Config::DEFAULT_PAGINATION_PER_PAGE
    end
  end
end
