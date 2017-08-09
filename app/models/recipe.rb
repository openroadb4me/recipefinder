class Recipe < ActiveRecord::Base
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api/search"
	default_params key: "d7c22d8953fcbe47679f95e58e359b4c"
	format :json

	def self.for term
		get("", query: { q: term})['recipes']
	end
end
#ENV['FOOD2FORK_KEY'] = "d7c22d8953fcbe47679f95e58e359b4c"