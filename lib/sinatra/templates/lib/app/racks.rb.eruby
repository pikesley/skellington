require 'rack/conneg'
require 'rack/tracker'

module <%= @gen.camelname %>
  class App < Sinatra::Base
    set :public_folder, 'public'
    set :views, 'views'

    if CONFIG['google-analytics-tag']
      use Rack::Tracker do
        handler :google_analytics, { tracker: CONFIG['google-analytics-tag'] }
      end
    end

    use Rack::Conneg do |conneg|
      conneg.set :accept_all_extensions, true
      conneg.set :fallback, :html
      conneg.ignore_contents_of 'public'
      conneg.provide [
        :html,
        :json
      ]
    end

    before do
      if negotiated?
        content_type negotiated_type
      end
    end
  end
end
