require "activesearch/#{Locomotive.config.search_engine}"
require "locomotive/active_search/#{Locomotive.config.search_engine}" rescue nil

module Locomotive
  Search = ::ActiveSearch.const_get(self.config.search_engine.to_s.classify)
end

CustomFields::Field.class_eval do
  field :searchable, type: Boolean, default: false
end