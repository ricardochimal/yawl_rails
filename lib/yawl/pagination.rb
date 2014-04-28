module Yawl
  module Config
    mattr_accessor :pagination_per_page

    DEFAULT_PAGINATION_PER_PAGE = 20
  end

  module Pagination
    module ClassMethods
      def pagination_dataset
        dataset.extension(:pagination)
      end
    end

    def self.included(klass)
      klass.extend(ClassMethods)
    end
  end
end

::Yawl::Process.send(:include, Yawl::Pagination)
