require 'spec_helper'
require_relative '../ip_address'

describe 'valid_ip?' do 
  it 'returns true for a valid ip address' do 
    expect(valid_ip?('127.0.0.1')).to eq(true)
  end

  it 'returns false for garbage input' do 
    expect(valid_ip?('hotdogs')).to eq(false)
    expect(valid_ip?('something.dog.com.dot.internet')).to eq(false)
  end
end