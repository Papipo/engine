module Locomotive
  module ActiveSearch
  end
end

if Locomotive.config.search_engine
  require "activesearch/#{Locomotive.config.search_engine}"
  require "active_search/#{Locomotive.config.search_engine}"
else
  require "locomotive/active_search/engine"
end