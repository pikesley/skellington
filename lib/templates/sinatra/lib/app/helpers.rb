module <%= @gen.camelname %>
  CONFIG = YAML.load_file('config/config.yml') || {}

  module Helpers
    def hello
      'Hello'
    end
  end
end
