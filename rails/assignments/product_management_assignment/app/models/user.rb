class User < ApplicationRecord
  has_many :products
  validates :name, :password, :dob, :address, :password_confirmation, presence: true
  validates :name, format: { with: /[a-zA-Z]+/ }
  validates :password, length: { minimum: 4 }
  validates :password, confirmation: { case_sensitive: true }
  validates :terms_of_services, acceptance: true
end
