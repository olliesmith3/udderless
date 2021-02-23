class Order < ApplicationRecord
  belongs_to :customer
  validates :quantity, presence: true 
end
