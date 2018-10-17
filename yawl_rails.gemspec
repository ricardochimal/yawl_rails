$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "yawl_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "yawl_rails"
  spec.version     = YawlRails::VERSION
  spec.authors     = ["Ricardo Chimal, Jr."]
  spec.email       = ["kiwi@null.cx"]
  spec.summary     = %q{Rails UI for YAWL}
  spec.description = %q{Rails UI for YAWL}
  spec.homepage    = ""
  spec.license     = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_dependency "yawl", "~> 0.3.0"
  spec.add_dependency "haml"

  spec.add_development_dependency "pg"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "capybara"
end
