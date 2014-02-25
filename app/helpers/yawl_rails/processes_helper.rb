require 'pp'

module YawlRails
  module ProcessesHelper
    def pretty_print_hash(hash)
      PP.pp(hash, out='')
      out
    end
  end
end
