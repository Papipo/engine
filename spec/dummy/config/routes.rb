Rails.application.routes.draw do

  mount Locomotive::Engine => '/locomotive', :as => 'locomotive'
  mount MyEngine::Engine => '/'

  match '/foo' => 'foo#index', :as => 'foo'

end
