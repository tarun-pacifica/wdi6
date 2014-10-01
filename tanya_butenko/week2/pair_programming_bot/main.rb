require 'sinatra'
require 'sinatra/reloader'

sitemap = {
	"test" => {
		:title => "Do you have a test for that?",
		:yes => "pass",
		:no => "write_test"
	},
	"pass" => {
		:title => "Does the test pass?",
		:yes => "refactor",
		:no => "write_code"
	},
	"write_test" => {
		:title => "Write a test",
		:yes => "pass",
		:no => nil
	},
	"refactor" => {
		:title => "Need to refactor",
		:yes => "refactored",
		:no => "select"
	},
	"refactored" => {
		:title => "Refactor the code",
		:yes => "pass",
		:no => nil
	},
	"write_code" => {
		:title => "Wright just enough code for the test to pass",
		:yes => "pass",
		:no => nil
	},
	"select" => {
		:title => "Select a new feature to implement",
		:yes => "test",
		:no => nil
	}
}

get '/' do
	id = params[:id] || 'test'
	@item = sitemap[id] || sitemap[:test] 
	erb :pair_prog
end

