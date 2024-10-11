class Customer < ActiveRecord::Base
  validates :first_name, length: { maximum: 20 }
  # validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 20 }
  validates :email, length: {maximum: 25}
  validates :phone, length: { maximum: 20 }
end