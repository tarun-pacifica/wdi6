require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get "/pair" do
	case params[:NAME]
		when "YES"
			erb :testpass
		when "NO"
			erb :writetest
	else
	erb :pair
	end
end

get "/testpass" do
	case params[:NAME]
		when "YES"
			erb :needtorefactor
		when "NO"
			erb :justenough
	else
	erb :pair
	end
end

get "/justenough" do
	case params[:NAME]
		when "DONE"
			erb :testpass
	else
	erb :pair
	end
end

get "/needtorefactor" do
	case params[:NAME]
		when "YES"
			erb :refactorcode
		when "NO"
			erb :selectfeature
	else
	erb :pair
	end
end

get "/refactorcode" do
	case params[:NAME]
		when "DONE"
			erb :testpass
	else
	erb :pair
	end
end

get "/selectfeature" do
	case params[:NAME]
		when "CONTINUE"
			erb :pair
	else
	erb :pair
	end
end

get "/writetest" do
	case params[:NAME]
		when "DONE"
			erb :testpass
	else
	erb :pair
	end
end