require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '*' do

  case request.path
  when '/'
  	@question_text = 'Do you have a test for that?' 
  	@yes_path = '/pass'
  	@no_path = '/write_test'
  	@done_path = nil
  when '/pass'
  	@question_text = 'Does the test pass?' 
  	@yes_path = '/refactor'
  	@no_path = '/write_code'
  	@done_path = nil
  when '/write_test'
  	@question_text = 'Write a test' 
  	@yes_path = nil
  	@no_path = nil
  	@done_path = '/pass'
  when '/write_code'
  	@question_text = 'Just enough code for the test to pass' 
  	@yes_path = nil
  	@no_path = nil
  	@done_path = '/pass'
  when '/refactor'
  	@question_text = 'Need to refactor?' 
  	@yes_path = '/no_refactor'
  	@no_path = '/new_feature'
  	@done_path = nil
  when '/no_refactor'
  	@question_text = 'Refactor code' 
  	@yes_path = nil
  	@no_path = nil
  	@done_path = '/pass'
  when '/new_feature'
  	@question_text = 'Select a new feature to implement' 
  	@yes_path = nil
  	@no_path = nil
  	@done_path = '/'
  end
  erb :pp  

end

