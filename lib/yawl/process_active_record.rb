require "yawl/process"

module Yawl
  class Process < Sequel::Model
    def object
      return unless values[:object_id] && object_type

      klass = object_type.constantize
      klass.find(values[:object_id])
    end
  end
end
