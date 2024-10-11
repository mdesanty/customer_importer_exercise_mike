class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    unless ActiveRecord::Base.connection.table_exists?(:customers)
      create_table :customers do |t|
        t.string :customer_id
        t.string :first_name
        t.string :last_name
        t.string :email
        t.string :phone
        t.string :address_street
        t.string :address_city
        t.string :address_state
        t.string :address_zip
        t.timestamps
      end
    end
  end
end

CreateCustomers.migrate(:up)