class ActiveSearch::Mongoid::Model
  def to_liquid
    _stored.inject({}) do |memo,(k,v)|
      if v.respond_to?(:has_key?) && v.has_key?(I18n.locale.to_s)
        memo.merge(k => v[I18n.locale.to_s])
      else
        memo.merge(k => v)
      end
    end
  end
end