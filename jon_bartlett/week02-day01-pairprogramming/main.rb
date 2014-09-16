require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '*' do

	@qmap = {}

  @qmap['/'] = ['Do you have a test for that?','/pass','/write_test',nil]
  @qmap['/pass'] = ['Does the test pass?','/refactor','/write_code',nil]   
  @qmap['/write_test'] = ['Write a test',nil,nil,'/pass']   
  @qmap['/write_code'] = ['Just enough code for the test to pass',nil,nil,'/pass']   
  @qmap['/refactor'] = ['Need to refactor?','/no_refactor','/new_feature',nil]   
  @qmap['/no_refactor'] = ['Refactor code',nil,nil,'/pass']   
  @qmap['/new_feature'] = ['Select a new feature to implement',nil,nil,'/']     

  erb :pp  

end

