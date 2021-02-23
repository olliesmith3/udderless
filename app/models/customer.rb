class Customer < ApplicationRecord
  has_many :orders
  validates :email, presence: true
  validates :first_name, presence: true
  validates :address_line_1, presence: true
  validates :postcode, presence: true
end
