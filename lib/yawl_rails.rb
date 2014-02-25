require "yawl_rails/engine"

module YawlRails
  extend self

  attr_writer :application_controller_class

  def application_controller_class
    @@application_controller_class ||=  if defined?(::ApplicationController)
                                          ::ApplicationController
                                        else
                                          ::ActionController::Base
                                        end
  end
end
