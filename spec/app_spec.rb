require 'spec_helper'

describe 'CustomerImporter' do
  it 'should assert true' do
    expect(true).to eq(true)
  end

  it 'should import customers' do
    starting_count = Customer.count
    require_relative File.join('..', 'lib', 'app.rb')
    expect(Customer.count).to be > starting_count
  end
end










