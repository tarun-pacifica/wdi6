<form action"/search">
	<div class="movie_search">
		<input name="movie_search" placeholder="Movie Search">
		<button>Search Now!</button>
	</div>
</form>
<div>
	<% if params['movie_search'] %>
		<%@title = params['search_list'].gsub(' ', '+')%>
		<%movie_results = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }")%>
		<%movies = JSON.parse movie_results%> 
		<% movies["Search"].each do |m| %>
		<%= m["Title"] %>
		<% end %>
	<% end %>


 </div>