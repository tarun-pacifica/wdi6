# Grade School
# Write a small archiving program that stores students along with the grade that they are in.

# school = School.new("General Assembly Sydney")
# If no students have been added, the db should be empty:

# school.db
# # => {}
# When you add a student, they get added to the correct grade.

# school.add("James", 2)
# school.db
# # => {2 => ["James"]}
# You can, of course, add several students to the same grade, and students to different grades.

# school.add("Rusli", 2)
# school.add("Jade", 3)
# school.add("Little Jimmy", 1)
# school.db
# # => {2 => ["James", "Rusli"], 3 => ["Jade"], 1 => ["Little Jimmy"]}
# Also, you can ask for all the students in a single grade:

# school.grade(2)
# # => ["James", "Rusli"]
# Lastly, you should be able to get a sorted list of all the students. Grades are sorted in descending order numerically, and the students within them are sorted in ascending order alphabetically.

# school.sort
# # => {1 => ["Little Jimmy"], 2 => ["Rusli", "James"], 3 => ["Jade"]}
# Tarun's hints: Ruby has a cool method for sorting hashes, sort_by
# Source

# A pairing session with Phil Battos.

# Note well! This is just an in-memory style database, like with Happitails. You shouldn't use SQL/ActiveRecord for this exercise

system('clear')
require 'pry'


class School
	attr_reader :db # Just want to read the .db.

	def initialize(name) # Creating at name
		@db = {}
	end

	def add(student, grade)
		db[grade] ||= [] # Return db[grade] if it exists, if not return a blank array. Here what were doing is setting up the db and putting grade in the array.
		db[grade] << student
	end

	def grade(grade)
		db[grade] ||= [] # school.grade(7). Will return array of results so then we can use a .each do |student|. We need ||= [] so can we always call an .each function. Always want to return something consistent.
	end

	def sort
		sorted = db.sort_by { |grade, students| students.sort!; grade } # Need the ! on the sort to say go into students array and sort it where itcurrently is. Then sort the entire array by the current grade.
		Hash[sorted]
	end

end

puts school = School.new("General Assembly Sydney")
puts school.add("James", 2)
puts school.add("Rusli", 2)
puts school.add("Jade", 3)
puts school.add("Little Jimmy", 1)

binding.pry

# key = grade
# value = [student, student]




















