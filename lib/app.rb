require 'uri'
require 'net/http'

require_relative File.join('..', 'customer_importer.rb')

# Application execution code goes here
puts 'Running app...'

date = ARGV[0]
puts "Running app with date: #{date}" unless date.present?

uri = URI('https://customer-importer-exercise-api-c36ac5fc1e91.herokuapp.com/customers')
uri.query = URI.encode_www_form({ date: date }) if date.present?
response = Net::HTTP.get(uri)

puts "test"
data = JSON.parse(response)

for customer in data
  customer_attributes = {
     customer_id: customer['customerId'],
     first_name: customer['firstName'],
     last_name: customer['last_name'],
     email: customer['emailAddresses'].first['emailAddress'],
     phone: customer['phoneNumbers'][0]['phoneNumber'],
     address_street: customer['address']['street'],
     address_city: customer['address']['city'],
     address_state: customer['address']['state'],
     address_zip: customer['address']['postalCode']
  }

  customerRecord = Customer.where(customer_id: customer_attributes['customer_id']).first

  if customerRecord.present?
    customerRecord.update(customer_attributes)
  else
    Customer.create(customer_attributes)
  end

  puts "Up to " + Customer.all.size.to_s + " customers."
end