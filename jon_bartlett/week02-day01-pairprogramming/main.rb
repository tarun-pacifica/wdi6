require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '*' do

  @qmap = {
    '/' => {
      :question => 'Do you have a test for that?',
      :yes_path => '/pass',
      :no_path => '/write_test',
      :done_path => nil},
    '/pass' => {
      :question => 'Does the test pass?',
      :yes_path => '/refactor',
      :no_path => '/write_code',
      :done_path => nil},
    '/write_test' => {
      :question => 'Write a test',
      :yes_path => nil,
      :no_path => nil,
      :done_path => '/pass'},
    '/write_code' => {
      :question => 'Just enough code for the test to pass',
      :yes_path => nil,
      :no_path => nil,
      :done_path => '/pass'},
    '/refactor' => {
      :question => 'Need to refactor?',
      :yes_path => '/no_refactor',
      :no_path => '/new_feature',
      :done_path => nil},
    '/no_refactor' => {
      :question => 'Refactor code',
      :yes_path => nil,
      :no_path => nil,
      :done_path => '/pass'},
    '/new_feature' => {
      :question => 'Select a new feature to implement',
      :yes_path => nil,
      :no_path => nil,
      :done_path => '/'}
} 

  erb :pp  
end

