require File.join(File.dirname(__FILE__), 'lib/<%= @gen.wormname %>.rb')

run <%= @gen.camelname %>::App
