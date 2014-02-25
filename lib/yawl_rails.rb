require "yawl_rails/engine"

module YawlRails
  extend self

  mattr_accessor :parent_controller
  self.parent_controller = '::ApplicationController'
end
