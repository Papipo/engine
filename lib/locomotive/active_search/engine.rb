# this is a placeholder module
module Locomotive
  module ActiveSearch
    module Engine
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        def search_by(*args)
        end
      end
    end
  end
end