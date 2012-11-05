module Locomotive
  module Liquid
    module Drops
      class Site < Base

        delegate :name, :seo_title, :meta_keywords, :meta_description, :to => '_source'

        def index
          @index ||= self._source.pages.root.first
        end

        def pages
          @pages ||= liquify(*self._source.pages)
        end
        
        def search
          @search ||= ::ActiveSearch.search(@context.registers[:controller].params[:search]).where('_stored.site_id' => _source.id)
        end

      end
    end
  end
end
